# Omnivision — Studio Launch Kit

Omnivision is an independent studio focused on computer vision, applied AI delivery, inference optimization, and production software.

This repository contains the complete brand, website, documentation, and client outreach kit for launching the studio.

---

## 📁 Repository Overview

```
omnivision/
├── site/                                # Static marketing website (GitHub Pages ready)
│   ├── index.html                       # Responsive studio landing page with real case study
│   └── assets/                          # Self-contained branding and project assets
│       ├── favicon.svg                  # Omnivision reticle icon mark
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
```bash
./scripts/deploy_site.sh omnivision-site
```

The script will:
1. Create `omnivision-site` on GitHub under your `priyanshubcrecgenai2` account.
2. Push the `main` branch.
3. Automatically deploy the `site/` folder to `https://priyanshubcrecgenai2.github.io/omnivision-site`.

---

## 💼 Initial Service Tiers (Starting Hypotheses)

- **CV Pipeline Audit:** ₹15k–₹25k (Bottleneck profiling, frame drop diagnosis, architecture review)
- **Inference Optimization:** ₹30k–₹60k (FP16/INT8 acceleration, TensorRT compilation, CUDA benchmarks)
- **Scoped AI/CV Feature:** ₹60k–₹1.25L+ (Custom detection/tracking module, polygon zone logic, rule engine)
- **FastAPI / Container Deployment:** ₹20k–₹60k (Inference microservice, Docker packaging, RTSP reconnect resilience)

---

## 📬 Studio Contact

- **Email:** [omnivision.engineering@gmail.com](mailto:omnivision.engineering@gmail.com)
- **Portfolio Repository:** [github.com/priyanshubcrecgenai2/Traffic_survelliance](https://github.com/priyanshubcrecgenai2/Traffic_survelliance)
