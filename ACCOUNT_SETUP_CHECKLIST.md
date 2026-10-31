# MotiveLayer Studio — Setup & Launch Checklist

This document tracks the initial operational setup for MotiveLayer Engineering.

---

## 1. Business Email & Contact
- [x] **Target Address Selected:** `motivelayer.engineering@gmail.com`
- [ ] **Action Required:** Create the dedicated Google account at [accounts.google.com/signup](https://accounts.google.com/signup).
- [ ] Enable 2-step verification and download recovery codes.
- [ ] Configure mail forward or check email daily for incoming project inquiries.

---

## 2. GitHub Setup & Public Profile
- [x] **Primary Case Study Configured:** [Traffic Surveillance & Spatial Analytics](https://github.com/priyanshu596/Traffic_survelliance) is live, public, and linked across the site and documentation.
- [x] **Organization Profile README Created:** `github/ORGANIZATION_PROFILE_README.md` is populated with core focus areas, verified metrics, and public repository links.
- [x] **Case Study Spec Created:** `github/CASE_STUDY_TRAFFIC_SURVEILLANCE.md` provides full technical problem/solution details.
- [ ] **Optional (Recommended):** Create a GitHub Organization for the studio:
  - Visit [github.com/organizations/new](https://github.com/organizations/new)
  - Name: `motivelayer` or `motivelayer-eng`
  - Set contact email to `motivelayer.engineering@gmail.com`
  - Create a `.github` repository and copy `github/ORGANIZATION_PROFILE_README.md` to `.github/profile/README.md`.

---

## 3. Website & Free Hosting (GitHub Pages)
- [x] **Code & Design Complete:** `site/index.html` updated with modern styling, responsive typography, verified benchmarks, and real project screenshots (`assets/case-study/`).
- [x] **Placeholders Replaced:** All contact links now point to `motivelayer.engineering@gmail.com` and portfolio links point to `https://github.com/priyanshu596/Traffic_survelliance`.
- [x] **Local Assets Embedded:** Self-contained logos and screenshots stored in `site/assets/`.
- [x] **Automated Deployment Workflow Added:** `.github/workflows/deploy.yml` deploys the `site/` folder directly to GitHub Pages on every push to `main`.
- [ ] **To Publish on GitHub Pages:**
  ```bash
  # Step 1: Create a public repository (e.g. motivelayer-site or motivelayer_launch_kit)
  gh repo create motivelayer-site --public --source=. --remote=origin --push

  # Step 2: In GitHub repo settings -> Pages, select Source: "GitHub Actions" (or Deploy from branch -> main /site)
  # Your site will be live at: https://priyanshu596.github.io/motivelayer-site
  ```

---

## 4. LinkedIn Company Page
- [x] **Copy Kit Prepared:** `social/linkedin_company_page_copy.md` has the exact tagline, About text, industry, and first post.
- [ ] **Action Required:**
  1. Open LinkedIn on your desktop browser.
  2. Click **For Business** in the top navigation -> **Create a Company Page**.
  3. Select **Company** -> Page name: `MotiveLayer Engineering`.
  4. Fill in tagline, industry (Software Development), size (1 employee), and website URL.
  5. Upload `site/assets/favicon.svg` or `site/assets/logo.svg` as the profile picture.
  6. Paste the About text from `social/linkedin_company_page_copy.md`.
  7. Publish the first post announcing the studio and linking to `https://github.com/priyanshu596/Traffic_survelliance`.

---

## 5. Outreach & Client Sprints
- [x] **Outreach Templates Ready:** `social/outreach_templates.md` contains personalized, direct copy for agencies and product teams.
- [x] **Transparent Starting Rates Defined:**
  - CV Pipeline Audit: ₹15k–₹25k
  - Inference & Latency Optimization: ₹30k–₹60k
  - Scoped AI/CV Feature Sprint: ₹60k–₹1.25L+
  - FastAPI & Container Deployment: ₹20k–₹60k
- [ ] **Standard Contract Terms:** Ensure all client work begins with written acceptance criteria, milestone payments (e.g. 50% upfront, 50% upon acceptance), and explicit IP assignment terms.
