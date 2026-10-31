# Traffic Surveillance & Spatial Analytics Platform

> An end-to-end video analytics pipeline transforming high-density traffic camera streams into real-time, queryable database events with perspective lane localization and violation streak verification.

- **Public Repository:** [https://github.com/priyanshu596/Traffic_survelliance](https://github.com/priyanshu596/Traffic_survelliance)
- **Author / Studio:** MotiveLayer Engineering ([priyanshu596](https://github.com/priyanshu596))

---

## 1. Problem Statement

Standard traffic CCTV systems record continuous raw video pixels:
- Video archives are massive, unindexed, and computationally heavy to query post-hoc.
- Simple bounding box detectors lack spatial awareness: bounding box centers do not represent ground-contact points on elevated perspective cameras, leading to severe lane misclassification.
- High detector frame-to-frame jitter causes false alarms in rule enforcement (such as wrong-way alerts or restricted zone breaches).
- Disk writes from database persistence inside the computer vision loop can stall frame processing, causing dropped frames and stream drift.

This project solves these challenges by building an end-to-end edge pipeline that converts raw video feeds into structured, indexed SQLite records with sub-millisecond database overhead and spatial perspective accuracy.

---

## 2. Engineering Contributions

- **Inference Pipeline & Tensor Core Acceleration:** Implemented YOLOv11 running directly in FP16 half-precision on NVIDIA CUDA, delivering 25–35+ FPS on live 720p/1080p video feeds.
- **Ground-Contact Geometry Engine:** Formulated a spatial localization module using 4-point convex polygon tests (`cv2.pointPolygonTest`). Rather than using the bounding box centroid, the algorithm tests the bottom-center tire patch (`cx, y2`), ensuring mathematically correct lane matching under elevated camera angles.
- **Directional Classification & Rule Engine:** Developed bidirectional flow analysis (Top-to-Bottom `T2B` vs Bottom-to-Top `B2T`) and a multi-frame streak verification filter (4 consecutive confirmation frames) to eliminate false alarms from transient detector jitter.
- **Decoupled Asynchronous Persistence:** Engineered a dedicated background daemon worker using SQLite Write-Ahead Logging (WAL) and batch commits, keeping database persistence latency below 0.3 ms in the primary CV inference loop.
- **Interactive Web Interfaces:** Built a first-frame web configurator for operators to draw lane and zone polygons interactively, coupled with a real-time MJPEG live stream HUD and a zero-reload operations analytics center using Chart.js.

---

## 3. System Architecture

```
                  ┌───────────────────────────────┐
                  │      Fixed Camera Stream      │
                  │     (traffic_2.mp4, RTSP)     │
                  └───────────────┬───────────────┘
                                  │
                                  ▼
┌────────────────────────────────────────────────────────────────────────┐
│                      TRAFFIC VISION PIPELINE                           │
│                 (src/pipeline/traffic_pipeline.py)                     │
├────────────────────────────────────────────────────────────────────────┤
│ 1. Video Decode         │ cv2.VideoCapture (Frame Buffering)           │
│ 2. Vehicle Detection    │ YOLOv11 (FP16 Tensor Core CUDA Accelerated)  │
│ 3. Multi-Object Tracker │ ByteTrack / SORT Matching (min_hits=1, max=30)│
│ 4. Lane & Direction     │ 4-Point ROI pointPolygonTest at (cx, y2)     │
│ 5. Rule Verification    │ Multi-Frame Streak Verification (4 frames)   │
│ 6. Visual HUD Overlay   │ Real-Time Overlays & Live Measured FPS Badge │
└─────────────────────────────────┬──────────────────────────────────────┘
                                  │ (Non-blocking queue)
                                  ▼
┌────────────────────────────────────────────────────────────────────────┐
│                   PERSISTENCE LAYER (SQLite WAL)                       │
│  • Write-Ahead Logging (WAL) + Async Worker Queue                      │
│  • Latency in Vision Loop: < 0.3 ms                                    │
│  • Tables: vehicles, events (violations), counts                       │
└────────────────┬───────────────────────────────────────┬───────────────┘
                 │                                       │
                 ▼                                       ▼
┌─────────────────────────────────┐   ┌──────────────────────────────────┐
│         LIVE STREAM HUD         │   │    OPERATIONS ANALYTICS CENTER   │
│  • First-frame polygon setup    │   │  • High-frequency polling (1.5s) │
│  • Low-latency MJPEG stream     │   │  • Real-time Chart.js charts     │
│  • Real-time measured FPS       │   │  • Traffic flow timeline & gauge │
│  • Interactive pause / controls │   │  • Searchable vehicle table/CSV  │
└─────────────────────────────────┘   └──────────────────────────────────┘
```

---

## 4. Tech Stack

- **Core Language:** Python 3.10+
- **Deep Learning / Vision:** PyTorch, Ultralytics YOLOv11 (FP16 on CUDA), OpenCV
- **Multi-Object Tracking:** ByteTrack / IoU tracker
- **Data Persistence:** SQLite with Write-Ahead Logging (`PRAGMA journal_mode=WAL;`), Python `threading` & `queue.Queue`
- **Web & Serving:** Flask, MJPEG Streaming, Jinja2
- **Analytics Frontend:** Vanilla JavaScript, Chart.js, HTML5 Canvas

---

## 5. Verified Benchmarks & Evaluation

All measurements were taken with live video execution under real workloads.

| Metric | Measured Result | Test Conditions |
|---|---:|---|
| **Pipeline Throughput** | 25 – 35+ FPS | NVIDIA GPU (CUDA), FP16 half-precision, 720p resolution |
| **Persistence I/O Latency** | < 0.3 ms | Asynchronous thread queue with SQLite WAL mode |
| **Tracker Association Window** | 30 frames | ByteTrack IoU association (`max_age=30`, `min_hits=1`) |
| **Violation Noise Rejection** | 4-frame streak | Requires continuous spatial displacement and 4 consecutive frames |

---

## 6. Visual Evidence & Interface

- **Live Camera Stream & Region Configurator:** Allows dynamic creation of perspective lane polygons on frame 0.
- **Operations Analytics Center:** Real-time breakdown of vehicle mix (cars, motorcycles, buses, trucks, autos), directional traffic split, timeline flow rates, and incident logging.
- Screenshots available in the repository at `images/main-dashboard-1.png` and `images/analytics-dashboard.png`.

---

## 7. Known Failure Modes & Limitations

In accordance with our engineering principles, we document operational constraints:

1. **Camera Angle & License Plate Readability:** In elevated, wide-angle traffic overview cameras, pixel density per vehicle license plate is insufficient for optical character recognition. The ANPR module is modular and isolated for close-up choke-point cameras only.
2. **Severe Overlap in Stop-and-Go Congestion:** Heavy occlusions where vehicles completely block one another for >30 frames can cause track ID fragmentation. The system handles standard merge occlusions with ByteTrack, but bumper-to-bumper standstill requires additional re-identification models.
3. **Severe Weather / Glare:** High headlight bloom at night or heavy rain lens distortion can increase false positive detection jitter. The 4-frame streak verification reduces false violation triggers, but detection confidence thresholds should be tuned for nocturnal settings.

---

## 8. Reproducibility & Setup

```bash
# 1. Clone repository
git clone https://github.com/priyanshu596/Traffic_survelliance.git
cd Traffic_survelliance

# 2. Virtual environment setup
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# 3. Model weights & video sample
# Place YOLOv11 weights in models/UVH-26-MV-YOLOv11-S.pt
# Place test stream in traffic_2.mp4

# 4. Launch web application
python dashboard.py -v traffic_2.mp4 --device cuda

# 5. Access
# Live stream: http://localhost:5000
# Analytics:   http://localhost:5000/analytics
```
