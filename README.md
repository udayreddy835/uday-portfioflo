# Sai Uday Reddy - Modern Personal Portfolio Website

A complete, modern, professional personal portfolio website for **Sai Uday Reddy** (AI/ML Student, Python Developer, and Web Developer), featuring a responsive frontend, a Python Flask backend, and a functional Contact Form powered by the **Resend Email API**.

---

## 🌟 Overview & Key Features

- **Personal Information**: Pre-configured with Sai Uday Reddy's name, phone (`+91 6301099573`), and email (`udayreddy8886@gmail.com`).
- **Modern Dark UI/UX**: Obsidian dark theme (`#0b0f19`) with vibrant blue-purple gradient accents, glassmorphic cards, glowing borders, smooth hover animations, and subtle background glow orbs.
- **Hero Section**: Dynamic typewriter role rotator, quick contact pills, call-to-action buttons, and an interactive Python code card with floating tech badges.
- **About Section**: Detailed biography, learning mindset, problem-solving pillars, and 4 highlight cards.
- **Skills Section**: Categorized cards for Programming, AI/ML, Web Development, and Developer Tools.
- **Projects Section**: Interactive cards for **BrainBoost**, **Supermarket Sales Analysis**, and **AI Plant Disease Detection**, with technology tags and placeholder link dialogs.
- **Education Section**: Elegant vertical timeline with editable placeholders for degrees, institutions, and key coursework.
- **Services Section**: 5 dedicated technical capability cards (Web Development, Python Development, AI/ML Projects, Data Analysis, Portfolio Website Development).
- **Resume Section**: Dedicated CV section with working "Download Resume" and "View Resume" buttons linking to `resume.pdf`.
- **Functional Contact Form**:
  - Validates full name, email address, optional phone, subject, and message.
  - Submits asynchronously via `fetch()` without reloading the page.
  - Shows real-time character count and "Sending..." spinner loading states.
  - Returns clean, user-friendly success banners or error feedback while preserving entered form data on failure.
- **Production-Ready Python Flask Backend**:
  - `POST /api/contact`: Sanitizes inputs, prevents email injection/XSS, and sends formatted HTML & plain-text emails via the official Resend Python SDK.
  - `GET /api/health`: Uptime monitoring endpoint for Render/Vercel.
  - Static file serving for effortless single-command local development.
- **Zero API Key Leakage**: The Resend API key is stored exclusively on the server in `.env`. Frontend code never sees or contains secret credentials.

---

## 📁 Project Structure

```
uday-portfolio/
│
├── frontend/                     # Modern Frontend Application
│   ├── index.html                # Semantic, accessible HTML5 structure & SEO tags
│   ├── style.css                 # Responsive CSS3 styles, glassmorphism, & animations
│   ├── script.js                 # Vanilla JS for navbar, typing effect, & contact form API
│   ├── favicon.svg               # Monogram logo favicon
│   └── resume.pdf                # Starter resume document (replace with your own)
│
├── backend/                      # Python Flask Backend
│   ├── app.py                    # Flask API server, contact form endpoint, & Resend integration
│   ├── requirements.txt          # Python dependencies
│   ├── Procfile                  # Render / Heroku process declaration
│   ├── runtime.txt               # Python runtime specification (3.11.5)
│   ├── .env.example              # Environment variable template
│   └── .env                      # Local environment secrets (ignored by git)
│
├── vercel.json                   # Vercel configuration for frontend routing
├── render.yaml                   # Render Blueprint for automated backend deployment
├── .gitignore                    # Prevents .env, venv, and cache files from git
└── README.md                     # Comprehensive setup, testing, and deployment guide
```

---

## 🚀 Quick Start: Running Locally (Windows, Mac, Linux)

Follow these simple steps to run both the website and backend on your computer.

### Step 1: Open Terminal in the Project Directory

```powershell
# In PowerShell or Command Prompt:
cd "c:\Users\medag\OneDrive\Desktop\uday portfioflo"
```

### Step 2: Create and Activate a Python Virtual Environment

**On Windows:**
```powershell
python -m venv venv
.\venv\Scripts\activate
```

*(On macOS / Linux):*
```bash
python3 -m venv venv
source venv/bin/activate
```

### Step 3: Install Required Dependencies

```powershell
pip install -r backend/requirements.txt
```

*(Installed packages: `Flask`, `flask-cors`, `python-dotenv`, `resend`, `gunicorn`)*

### Step 4: Configure Your Environment File (`.env`)

A starter `.env` has already been prepared in `backend/.env`. You can edit it using VS Code, Notepad, or any text editor:

```env
# backend/.env

# 1. Your Resend API Key from https://resend.com/api-keys
RESEND_API_KEY=re_your_actual_api_key_here

# 2. Recipient email address where you want to receive messages
CONTACT_EMAIL=udayreddy8886@gmail.com

# 3. Sender address (use Resend's free test sender for initial setup):
RESEND_FROM_EMAIL=Portfolio Contact <onboarding@resend.dev>

# 4. Port and CORS settings
PORT=5000
CORS_ORIGIN=*
FLASK_ENV=development
```

### Step 5: Start the Flask Backend Server

You can start the server using **either** of these methods:

**Option A (Using npm):**
```powershell
npm run dev
```

**Option B (Direct Python command):**
```powershell
python backend/app.py
```

**Option C (Windows 1-click):**
Double-click `run.bat` in the project root folder. It will launch the Flask backend and automatically open `http://localhost:5000` in your default browser!

You will see:
```
==================================================
Sai Uday Reddy - Portfolio Server
Server running at: http://localhost:5000
API Endpoint:      http://localhost:5000/api/contact
Health Check:      http://localhost:5000/api/health
==================================================
```

### Step 6: View the Website in Your Browser

Open your browser and navigate to:
👉 **[http://localhost:5000](http://localhost:5000)**

*Note: The Flask server is configured to serve the complete frontend directly at `http://localhost:5000/`. You can browse the portfolio, download the resume, and test the contact form in one single running terminal!*

---

## 📧 How to Set Up the Resend Email API

The contact form uses [Resend](https://resend.com), a modern developer-first email platform.

### 1. Create a Free Resend Account
1. Go to **[https://resend.com](https://resend.com)** and sign up with your email (e.g., `udayreddy8886@gmail.com`).
2. Navigate to **API Keys** in the left sidebar: [https://resend.com/api-keys](https://resend.com/api-keys).
3. Click **Create API Key**.
4. Name it `Portfolio Contact Form` and copy the generated key (it starts with `re_...`).

### 2. Add the Key to Your `.env`
Open `backend/.env` and replace `re_test_placeholder_key` with your real key:
```env
RESEND_API_KEY=re_123456789abcdef...
```

### 3. Understanding the Sender Address
- **Testing Mode (No Custom Domain required)**:
  Resend allows instant testing using their free sandbox domain:
  ```env
  RESEND_FROM_EMAIL=Portfolio Contact <onboarding@resend.dev>
  ```
  *In sandbox mode, Resend delivers emails to the email address registered on your Resend account (`udayreddy8886@gmail.com`). This is 100% free and requires zero DNS setup!*
- **Production Mode (With your custom domain, optional)**:
  If you purchase a custom domain later (e.g., `saiudayreddy.dev`), add it to [Resend Domains](https://resend.com/domains), verify the 3 DNS records, and update `RESEND_FROM_EMAIL`:
  ```env
  RESEND_FROM_EMAIL=Portfolio Contact <contact@saiudayreddy.dev>
  ```

---

## 🧪 Testing the Contact Form

1. Start `python backend/app.py`.
2. Open `http://localhost:5000` in your browser.
3. Scroll down to the **Contact** section.
4. Fill in:
   - **Name**: `Test Visitor`
   - **Email**: `your_other_email@example.com`
   - **Phone**: `+91 9876543210`
   - **Subject**: `Internship Opportunity`
   - **Message**: `Hi Sai Uday, I am testing your newly created portfolio contact form!`
5. Click **Send Message**.
6. **Watch the interactive states**:
   - The button shows a spinner and text changes to "Sending Message...".
   - Once sent, a bright green success banner appears: *"Your message has been sent successfully. Thank you for reaching out!"*
   - The form fields automatically clear.
   - Check your inbox at `udayreddy8886@gmail.com` for the beautifully formatted HTML notification email!
   - Hitting "Reply" in your email client will reply directly to `your_other_email@example.com`.

---

## ☁️ Deployment Guide

This project is designed for clean, reliable deployment:
- **Frontend**: Hosted on [Vercel](https://vercel.com) (Lightning-fast global CDN, free tier)
- **Backend**: Hosted on [Render](https://render.com) (Free Python Flask web service)

### Part 1: Deploy Backend on Render

1. Push your portfolio code to your GitHub account (do **NOT** commit `backend/.env`; the `.gitignore` automatically excludes it).
2. Go to [https://render.com](https://render.com) and log in.
3. Click **New +** -> **Web Service**.
4. Connect your GitHub repository.
5. Configure the service:
   - **Name**: `sai-uday-reddy-portfolio-backend`
   - **Region**: Choose the region closest to you (e.g., Singapore or Frankfurt).
   - **Branch**: `main`
   - **Root Directory**: `backend` (or leave blank if using the root `render.yaml`)
   - **Runtime**: `Python 3`
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `gunicorn app:app --bind 0.0.0.0:$PORT`
6. Under **Environment Variables**, add:
   | Key | Value |
   |---|---|
   | `RESEND_API_KEY` | `re_your_actual_resend_api_key` |
   | `CONTACT_EMAIL` | `udayreddy8886@gmail.com` |
   | `RESEND_FROM_EMAIL` | `Portfolio Contact <onboarding@resend.dev>` |
   | `CORS_ORIGIN` | `*` (or your frontend Vercel domain) |
   | `FLASK_ENV` | `production` |
7. Click **Create Web Service**.
8. Once deployed, Render will provide a live URL, for example:
   `https://sai-uday-reddy-portfolio-backend.onrender.com`
9. Test the health endpoint in your browser:
   `https://sai-uday-reddy-portfolio-backend.onrender.com/api/health`
   You should see `{"status": "ok", ...}`.

### Part 2: Connect Frontend to Backend & Deploy on Vercel

1. In `frontend/script.js`, set your Render backend URL so the contact form knows where to send requests in production.
   At line 25 of `frontend/script.js`:
   ```javascript
   // Replace the empty string "" with your Render backend URL:
   return "https://sai-uday-reddy-portfolio-backend.onrender.com";
   ```
   *(Or alternatively, add a `<script>` tag before `script.js` in `index.html`:*
   ```html
   <script>window.PORTFOLIO_CONFIG = { API_URL: 'https://sai-uday-reddy-portfolio-backend.onrender.com' };</script>
   ```
   *)*

2. Go to [https://vercel.com](https://vercel.com) and click **Add New...** -> **Project**.
3. Import your GitHub repository.
4. Set **Root Directory** to `frontend` (or keep root, since `vercel.json` already points to `frontend`).
5. Click **Deploy**.
6. Within seconds, your portfolio is live worldwide with SSL!

---

## ✏️ How to Customize Your Content Later

### 1. Update Education Details
Open `frontend/index.html` and search for:
`<!-- EDIT YOUR DEGREE & COLLEGE DETAILS BELOW -->`
Replace the placeholders:
- Degree: e.g. `Bachelor of Technology in Computer Science & Engineering (AI/ML)`
- University / College: Your college name
- Year: e.g. `2022 - 2026`

### 2. Update Projects & Links
In `frontend/index.html`, each project card contains:
```html
<a href="https://github.com/yourusername/project-repo" target="_blank" class="btn btn-sm btn-outline">
  <span>GitHub</span>
</a>
<a href="https://your-project-demo.com" target="_blank" class="btn btn-sm btn-primary">
  <span>Live Demo</span>
</a>
```
Simply replace the `#projects` hrefs with your actual GitHub or Live Demo links. If kept as `#projects`, clicking them displays an informative pop-up modal.

### 3. Replace Resume PDF
To update your resume:
1. Export your real resume as a PDF named `resume.pdf`.
2. Place it in `frontend/resume.pdf` (replacing the starter placeholder).
3. The "Download Resume" and "View Resume" buttons will automatically serve your updated document!

### 4. Add Social Media Links
In `frontend/index.html`, in the `#contact` and footer sections, you can add links to your LinkedIn, GitHub, or Twitter profiles using standard `<a>` tags.

---

## 🔒 Security Summary

- **No Secrets in Frontend**: `RESEND_API_KEY` is never included in HTML, CSS, or client-side JavaScript.
- **Server-Side Validation**: All incoming requests to `/api/contact` are strictly validated on the Flask server for correct types, lengths, and regex patterns.
- **XSS & Injection Protection**: User input is HTML-escaped using Python's `html.escape()` before being rendered into the email template.
- **Git Safety**: `.env` is listed in `.gitignore` to prevent sensitive credentials from ever being published.

---

## 👨‍💻 Author

**Sai Uday Reddy**
- **Email**: [udayreddy8886@gmail.com](mailto:udayreddy8886@gmail.com)
- **Phone**: [+91 6301099573](tel:+916301099573)
- **Focus**: Artificial Intelligence, Machine Learning, Python Development, Web Engineering
