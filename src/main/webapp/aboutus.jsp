<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About Us - StockCraft Inventory</title>
<style>
    :root {
        color-scheme: dark;
        --page-bg: #071522;
        --panel-bg: #0d1f2e;
        --panel-soft: #122741;
        --line: rgba(220, 237, 255, 0.12);
        --text: #eefbff;
        --muted: #aebcca;
        --soft-muted: #d8eaf9;
        --dim: #7e93ad;
        --green: #81f6b1;
        --mint: #9dffd2;
        --cyan: #8ffcf3;
        --blue: #7b9dff;
        --purple: #a48bff;
        --pink: #ff9adf;
        --orange: #ffc776;
        --danger: #ff8c8c;
        --font: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        min-height: 100vh;
        color: var(--text);
        background:
            radial-gradient(circle at 72% 8%, rgba(71, 185, 170, 0.12), transparent 16%),
            radial-gradient(circle at 80% 78%, rgba(38, 101, 255, 0.13), transparent 19%),
            linear-gradient(180deg, var(--page-bg), #081624);
        font-family: var(--font);
    }

    a {
        color: inherit;
        text-decoration: none;
    }

    header {
        position: sticky;
        top: 0;
        z-index: 10;
        background: rgba(7, 21, 34, 0.82);
        backdrop-filter: blur(14px);
        border-bottom: 1px solid var(--line);
        padding: 26px 48px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .brand {
        display: flex;
        align-items: center;
        gap: 12px;
    }

    .brand-mark {
        width: 42px;
        height: 42px;
        border-radius: 50%;
        display: grid;
        place-items: center;
        border: 1px solid var(--line);
        background: rgba(128, 252, 225, 0.08);
        color: var(--mint);
        font-size: 1.1rem;
        box-shadow: 0 0 30px rgba(129, 246, 177, 0.12);
    }

    .brand-text {
        display: flex;
        flex-direction: column;
        gap: 3px;
    }

    .brand-text strong {
        font-size: 1.22rem;
        letter-spacing: 0.06em;
    }

    .brand-text span {
        color: var(--muted);
        font-size: 0.76rem;
        letter-spacing: 0.12em;
        text-transform: uppercase;
    }

    nav {
        display: flex;
        align-items: center;
        gap: 26px;
    }

    nav a {
        color: var(--soft-muted);
        font-size: 0.93rem;
        transition: color 0.2s ease;
    }

    nav a:hover {
        color: var(--green);
    }

    .nav-login {
        padding: 12px 22px;
        background: linear-gradient(135deg, var(--green), var(--cyan));
        color: #05311d;
        font-weight: 800;
        border-radius: 999px;
        border: 1px solid rgba(255, 255, 255, 0.4);
    }

    .logout-btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 12px 22px;
        border-radius: 999px;
        background: linear-gradient(135deg, var(--green), var(--cyan));
        color: #071522;
        font-weight: 800;
        border: none;
        cursor: pointer;
    }

    .logout-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 20px 50px rgba(129, 246, 177, 0.18);
    }

    main {
        width: min(1180px, calc(100% - 56px));
        margin: 0 auto;
        padding: 50px 0 80px;
    }

    .section {
        padding: 60px 0;
    }

    .section-title {
        display: inline-flex;
        align-items: center;
        gap: 10px;
        color: var(--mint);
        text-transform: uppercase;
        letter-spacing: 0.22em;
        font-size: 0.78rem;
        font-weight: 700;
        margin-bottom: 20px;
    }

    .section-title::before {
        content: "";
        display: inline-block;
        width: 36px;
        height: 2px;
        background: var(--mint);
    }

    .section-heading {
        font-size: clamp(2rem, 4vw, 3.2rem);
        margin: 0 0 24px;
        line-height: 1.08;
    }

    .section-copy {
        max-width: 760px;
        font-size: 1rem;
        line-height: 1.85;
        color: var(--soft-muted);
        margin-bottom: 30px;
    }

    .feature-list {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 24px;
        margin-top: 36px;
    }

    .feature-card {
        border-radius: 24px;
        background: rgba(255,255,255,0.035);
        border: 1px solid var(--line);
        padding: 28px;
        transition: transform 0.25s ease, background 0.25s ease;
        min-height: 180px;
    }

    .feature-card:hover {
        transform: translateY(-4px);
        background: rgba(255,255,255,0.08);
    }

    .feature-card h3 {
        margin: 0 0 12px;
        font-size: 1.2rem;
    }

    .feature-card p {
        margin: 0;
        color: var(--muted);
        line-height: 1.7;
    }

    .metrics-strip {
        display: grid;
        grid-template-columns: repeat(4, minmax(0, 1fr));
        gap: 14px;
        margin-top: 20px;
    }

    .metric-card {
        background: rgba(255,255,255,0.035);
        border: 1px solid var(--line);
        border-radius: 20px;
        padding: 22px;
    }

    .metric-card span {
        display: block;
        color: var(--muted);
        font-size: 0.74rem;
        letter-spacing: 0.16em;
        text-transform: uppercase;
    }

    .metric-card strong {
        display: block;
        color: var(--green);
        font-size: 1.9rem;
        margin-top: 12px;
    }

    .back-link {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        margin-top: 32px;
        padding: 12px 24px;
        border-radius: 999px;
        background: rgba(255, 255, 255, 0.08);
        border: 1px solid var(--line);
        color: var(--text);
        font-weight: 600;
        transition: transform 0.25s ease, background 0.25s ease;
    }

    .back-link:hover {
        background: rgba(255, 255, 255, 0.14);
        transform: translateY(-2px);
    }

    footer {
        background: rgba(7, 21, 34, 0.84);
        border-top: 1px solid var(--line);
        padding: 28px 48px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 20px;
        flex-wrap: wrap;
    }

    .footer-copy {
        color: var(--muted);
        font-size: 0.88rem;
    }

    .footer-links {
        display: flex;
        gap: 22px;
        flex-wrap: wrap;
    }

    .footer-links a {
        color: var(--muted);
        font-size: 0.88rem;
    }

    .footer-links a:hover {
        color: var(--green);
    }

    @media (max-width: 960px) {
        header {
            flex-wrap: wrap;
            gap: 20px;
            flex-direction: column;
        }

        nav {
            width: 100%;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .feature-list,
        .metrics-strip {
            grid-template-columns: 1fr;
        }
    }

    @media (max-width: 640px) {
        header,
        footer {
            padding-left: 20px;
            padding-right: 20px;
        }

        .section-heading {
            font-size: clamp(1.8rem, 10vw, 2.6rem);
        }

        nav {
            flex-direction: column;
            gap: 12px;
        }
    }
</style>
</head>
<body>
    <header>
        <a class="brand" href="welcome.jsp">
            <span class="brand-mark">?</span>
            <span class="brand-text">
                <strong>StockCraft</strong>
                <span>Inventory System</span>
            </span>
        </a>
        <nav>
            <a href="welcome.jsp">Home</a>
            <a href="#overview">Overview</a>
            <a href="#process">Process</a>
            <a href="#reports">Reports</a>
            <form action="Logout" method="post" style="margin: 0;">
                <button type="submit" class="logout-btn">Logout</button>
            </form>
        </nav>
    </header>

    <main>
        <section class="section">
            <div class="section-title">About Us</div>
            <h1 class="section-heading">StockCraft Inventory Management</h1>
            <p class="section-copy">StockCraft is an inventory management platform built to help businesses track product availability, supplier activity, stock movement, warehouse fulfillment, and reorder planning from a single operational flow.</p>

            <div class="metrics-strip">
                <div class="metric-card">
                    <span>Warehouses</span>
                    <strong>09</strong>
                </div>
                <div class="metric-card">
                    <span>Products</span>
                    <strong>26.4k</strong>
                </div>
                <div class="metric-card">
                    <span>Fill Rate</span>
                    <strong>97%</strong>
                </div>
                <div class="metric-card">
                    <span>Stock Risk</span>
                    <strong>Low</strong>
                </div>
            </div>
        </section>

        <section class="section" id="overview">
            <div class="section-title">Our Platform</div>
            <h2 class="section-heading">A complete inventory workflow.</h2>
            <p class="section-copy">The StockCraft system supports registration, login, product entry, warehouse activity, and inventory visibility. It is designed to centralize stock management for teams who need clear product records, supplier details, and stock-level decisions.</p>

            <div class="feature-list">
                <div class="feature-card">
                    <h3>?? Inventory Visibility</h3>
                    <p>Track product records, current stock quantity, reorder threshold, storage warehouse, category, and product movement through the inventory dashboard.</p>
                </div>
                <div class="feature-card">
                    <h3>?? Supplier & Procurement</h3>
                    <p>Connect product supply with supplier records and purchasing decisions to reduce stock shortages and strengthen reorder planning.</p>
                </div>
                <div class="feature-card">
                    <h3>?? Warehouse Operations</h3>
                    <p>Coordinate product placement, stock movement, and warehouse-level operations with a unified inventory record system.</p>
                </div>
                <div class="feature-card">
                    <h3>?? Reporting & Planning</h3>
                    <p>Use inventory information to create stock reports, manage order signals, and support better category and supplier decisions.</p>
                </div>
            </div>
        </section>

        <section class="section" id="process">
            <div class="section-title">Our Mission</div>
            <h2 class="section-heading">Make stock decisions faster and more accurate.</h2>
            <p class="section-copy">StockCraft helps operations teams maintain product confidence by turning inventory information into a reliable source of truth. Every product record supports better stock control, supply continuity, and fulfillment readiness.</p>
        </section>

        <section class="section" id="reports">
            <div class="section-title">Operations</div>
            <h2 class="section-heading">From product entry to stock accountability.</h2>
            <p class="section-copy">Our platform supports a practical delivery flow: users register, log in, enter inventory product details, and manage stock records using structured product information stored in MySQL.</p>
        </section>

        <section class="section">
            <a href="welcome.jsp" class="back-link">? Back to Dashboard</a>
        </section>
    </main>

    <footer>
        <div class="footer-copy">� 2026 StockCraft Inventory System. All rights reserved.</div>
        <div class="footer-links">
            <a href="welcome.jsp">Home</a>
            <a href="aboutus.jsp">About</a>
            <a href="login.jsp">Portal</a>
        </div>
    </footer>

   
</body>
</html>
