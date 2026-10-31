# MotiveLayer Engineering — Studio Launch Kit

MotiveLayer Engineering is an independent studio focused on computer vision, applied AI delivery, inference optimization, and production software.

This repository contains the complete brand, website, documentation, and client outreach kit for launching the studio.

---

## 📁 Repository Overview

```
motivelayer_launch_kit/
├── site/                                # Static marketing website (GitHub Pages ready)
│   ├── index.html                       # Responsive studio landing page with real case study
│   └── assets/                          # Self-contained branding and project assets
│       ├── favicon.svg                  # Studio icon mark
│       ├── logo.svg                     # Wordmark & vector logo
│       └── case-study/                  # Screenshots from Traffic Surveillance pipeline
│           ├── analytics-dashboard.png  # Operations Analytics Center preview
│           └── main-dashboard-1.png     # Live stream & polygon drawer
│
├── github/                              # GitHub profile & documentation assets
│   ├── ORGANIZATION_PROFILE_README.md   # Markdown profile for GitHub Organization
│   ├── CASE_STUDY_TRAFFIC_SURVEILLANCE.md # Full technical case study documentation
│   └── PROJECT_README_TEMPLATE.md       # Standard template for future project case studies
│
├── social/                              # Marketing & outreach kit
│   ├── linkedin_company_page_copy.md    # Pre-formatted LinkedIn company profile and announcement post
│   └── outreach_templates.md            # Direct outreach templates for agencies & product teams
│
├── .github/workflows/deploy.yml         # GitHub Actions automated deployment for GitHub Pages
├── ACCOUNT_SETUP_CHECKLIST.md           # Operational checklist and deployment instructions
└── README.md                            # Studio overview and navigation
```

---

## 🚀 Quick Preview & Local Testing

You can preview the website locally with Python:

```bash
cd site
python3 -m http.server 8080
# Open http://localhost:8080 in your browser
```

---

## 🌐 Deploying to GitHub Pages

The repository includes a ready-to-run GitHub Actions workflow in `.github/workflows/deploy.yml`.

To deploy:
1. Initialize a Git repo and push to GitHub:
   ```bash
   git init
   git add .
   git commit -m "Initialize MotiveLayer Engineering launch kit"
   gh repo create motivelayer-site --public --source=. --remote=origin --push
   ```
2. In your repository on GitHub:
   - Go to **Settings** → **Pages**.
   - Under **Build and deployment** > **Source**, choose **GitHub Actions**.
   - The workflow will automatically publish the site to `https://priyanshu596.github.io/motivelayer-site`.

---

## 💼 Initial Service Tiers (Starting Hypotheses)

- **CV Pipeline Audit:** ₹15k–₹25k (Bottleneck profiling, frame drop diagnosis, architecture review)
- **Inference Optimization:** ₹30k–₹60k (FP16/INT8 acceleration, TensorRT compilation, CUDA benchmarks)
- **Scoped AI/CV Feature:** ₹60k–₹1.25L+ (Custom detection/tracking module, polygon zone logic, rule engine)
- **FastAPI / Container Deployment:** ₹20k–₹60k (Inference microservice, Docker packaging, RTSP reconnect resilience)

---

## 📬 Studio Contact

- **Email:** [motivelayer.engineering@gmail.com](mailto:motivelayer.engineering@gmail.com)
- **Portfolio Repository:** [github.com/priyanshu596/Traffic_survelliance](https://github.com/priyanshu596/Traffic_survelliance)
