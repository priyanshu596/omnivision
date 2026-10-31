# Omnivision

Omnivision is an independent engineering studio focused on computer vision, applied AI, and inference acceleration. We build detection pipelines, optimize GPU runtimes, and deploy containerized vision services for product teams and AI consultancies.

---

### Capabilities

- **Detection and tracking:** YOLO detection pipelines, ByteTrack persistent multi-object tracking, and perspective polygon geometry for spatial rule enforcement.
- **Inference optimization:** Hardware-targeted execution using NVIDIA CUDA FP16 and TensorRT compilation. Latency profiling, memory bottleneck diagnosis, and batching strategies.
- **Inference backends:** FastAPI services, decoupled asynchronous SQLite WAL queues (<0.3 ms disk I/O in vision loops), and event streaming.
- **Production deployment:** Docker containerization, RTSP stream reconnect logic for network dropouts, Linux edge hardware setup, and operational runbooks.

---

### Featured Work

#### [Traffic Surveillance & Spatial Analytics Platform](https://github.com/priyanshubcrecgenai2/Traffic_survelliance)
An edge video analytics pipeline that processes live camera streams into structured database records in real time.
- **Pipeline:** YOLOv11 FP16 on NVIDIA Tensor Cores, ByteTrack tracker, and 4-point ground-contact polygon evaluation (`cv2.pointPolygonTest`) evaluated at `(cx, y2)`.
- **Measured throughput:** 25 to 35+ FPS on 720p/1080p video streams with <0.3 ms database persistence latency.
- **Operations:** Web configurator for drawing perspective lane boundaries, real-time MJPEG live stream HUD, and Chart.js analytics dashboard.
- **Source code:** [github.com/priyanshubcrecgenai2/Traffic_survelliance](https://github.com/priyanshubcrecgenai2/Traffic_survelliance)

---

### Operating Principles

1. **Measured benchmarks:** Every reported metric specifies hardware, input resolution, model architecture, and measurement protocol.
2. **Defined scopes:** We take on fixed-scope sprints with agreed quantitative acceptance criteria.
3. **Operational limits:** We document edge cases, camera vantage constraints, and failure modes directly.
4. **Clean handovers:** Deliverables include containerized code, configuration schemas, and deployment verification scripts.

---

### Inquiries

We take on scoped engineering sprints, pipeline audits, and subcontracting tasks.

- **Email:** [omnivision.engineering@gmail.com](mailto:omnivision.engineering@gmail.com)
- **GitHub:** [github.com/priyanshubcrecgenai2](https://github.com/priyanshubcrecgenai2)
