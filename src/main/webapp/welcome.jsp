<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Inventory Management System</title>
<style>
    :root {
        --page-bg: #071120;
        --panel-bg: #111a2c;
        --panel-soft: #18213a;
        --text: #eef2ff;
        --muted: #aeb6d7;
        --soft-muted: #c7cfef;
        --divider: rgba(255,255,255,0.10);
        --green: #72f1b7;
        --blue: #7bbcfb;
        --purple: #9d8cff;
        --pink: #f7a0d8;
        --danger: #ff9ca6;
        --shadow: rgba(0,0,0,0.5);
        --font: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        min-height: 100vh;
        font-family: var(--font);
        background: radial-gradient(circle at top left, rgba(123, 188, 251, 0.12), transparent 24%),
                    radial-gradient(circle at bottom right, rgba(157, 140, 255, 0.14), transparent 25%),
                    var(--page-bg);
        color: var(--text);
    }

    a {
        color: inherit;
        text-decoration: none;
    }

    .app-shell {
        min-height: 100vh;
        display: flex;
    }

    .sidebar {
        width: 250px;
        background: rgba(9, 18, 40, 0.92);
        border-right: 1px solid var(--divider);
        padding: 30px 24px;
        position: fixed;
        inset: 0 auto 0 0;
    }

    .brand-wrap {
        display: flex;
        align-items: center;
        gap: 12px;
        margin-bottom: 50px;
    }

    .brand-icon {
        width: 44px;
        height: 44px;
        border-radius: 14px;
        background: linear-gradient(135deg, var(--purple), var(--blue));
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: 800;
        font-size: 1.2rem;
        color: #fff;
        box-shadow: 0 14px 30px rgba(123, 188, 251, 0.2);
    }

    .brand-name {
        font-size: 1.05rem;
        font-weight: 800;
        letter-spacing: 0.08em;
    }

    .brand-sub {
        color: var(--muted);
        font-size: 0.75rem;
        margin-top: 4px;
    }

    .sidebar-title {
        color: var(--muted);
        font-size: 0.72rem;
        font-weight: 700;
        letter-spacing: 0.16em;
        text-transform: uppercase;
        margin: 30px 0 12px;
    }

    .menu-list {
        display: flex;
        flex-direction: column;
        gap: 12px;
    }

    .menu-link {
        padding: 12px 14px;
        border-radius: 12px;
        color: var(--soft-muted);
        font-size: 0.92rem;
        border: 1px solid transparent;
        transition: 0.24s ease all;
    }

    .menu-link.active,
    .menu-link:hover {
        background: var(--panel-soft);
        border-color: var(--purple);
        color: #ffffff;
    }

    .main {
        flex: 1;
        margin-left: 250px;
        padding: 32px 44px 70px;
    }

    .topbar {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 24px;
        margin-bottom: 28px;
    }

    .page-kicker {
        display: inline-block;
        color: var(--blue);
        font-size: 0.78rem;
        font-weight: 700;
        letter-spacing: 0.20em;
        text-transform: uppercase;
    }

    .page-title {
        margin: 12px 0 0;
        font-size: clamp(2rem, 3vw, 2.65rem);
        font-weight: 800;
        letter-spacing: -0.035em;
    }

    .topbar-actions {
        display: flex;
        align-items: center;
        gap: 14px;
    }

    .search-box {
        width: min(260px, 240px);
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 12px 15px;
        border-radius: 14px;
        background: var(--panel-soft);
        border: 1px solid var(--divider);
        color: var(--muted);
    }

    .search-box input {
        width: 100%;
        background: transparent;
        border: 0;
        outline: none;
        color: var(--text);
        font-family: inherit;
    }

    .primary-btn,
    .secondary-btn {
        border: none;
        padding: 12px 20px;
        border-radius: 12px;
        font-family: inherit;
        font-weight: 700;
        cursor: pointer;
        transition: transform 0.2s ease, box-shadow 0.2s ease, background 0.2s ease;
    }

    .primary-btn {
        background: linear-gradient(135deg, var(--purple), var(--blue));
        color: #fff;
    }

    .secondary-btn {
        background: transparent;
        color: var(--text);
        border: 1px solid var(--divider);
    }

    .primary-btn:hover,
    .secondary-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 12px 22px var(--shadow);
    }

    .stats-grid {
        display: grid;
        grid-template-columns: repeat(4, minmax(180px, 1fr));
        gap: 16px;
        margin-bottom: 20px;
    }

    .stat-card {
        background: var(--panel-bg);
        border: 1px solid var(--divider);
        border-radius: 18px;
        padding: 22px 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 10px;
    }

    .stat-card .label {
        color: var(--muted);
        font-size: 0.78rem;
        font-weight: 700;
        letter-spacing: 0.12em;
        text-transform: uppercase;
    }

    .stat-card .value {
        color: var(--text);
        font-size: 2rem;
        font-weight: 800;
        margin-top: 12px;
    }

    .stat-card .trend {
        color: var(--green);
        font-size: 0.76rem;
        font-weight: 700;
    }

    .stat-icon {
        width: 44px;
        height: 44px;
        border-radius: 14px;
        display: flex;
        align-items: center;
        justify-content: center;
        background: rgba(255,255,255,0.05);
        color: var(--green);
        font-size: 1.2rem;
        border: 1px solid var(--divider);
    }

    .content-grid {
        display: grid;
        grid-template-columns: minmax(440px, 0.95fr) minmax(450px, 1.05fr);
        gap: 20px;
        align-items: start;
    }

    .panel {
        background: var(--panel-bg);
        border: 1px solid var(--divider);
        border-radius: 24px;
        padding: 24px;
        box-shadow: 0 25px 50px var(--shadow);
    }

    .panel-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 16px;
        margin-bottom: 22px;
    }

    .panel-title {
        font-size: 1.1rem;
        font-weight: 800;
        letter-spacing: 0.04em;
    }

    .panel-chip {
        color: var(--green);
        border: 1px solid var(--green);
        padding: 7px 12px;
        border-radius: 999px;
        font-size: 0.74rem;
        font-weight: 800;
        letter-spacing: 0.10em;
    }

    .inventory-form {
        display: flex;
        flex-direction: column;
        gap: 16px;
    }

    .form-grid {
        display: grid;
        grid-template-columns: repeat(2, minmax(160px, 1fr));
        gap: 16px;
    }

    label {
        display: flex;
        flex-direction: column;
        gap: 8px;
        color: var(--soft-muted);
        font-size: 0.76rem;
        font-weight: 700;
        letter-spacing: 0.10em;
        text-transform: uppercase;
    }

    input,
    select,
    textarea {
        width: 100%;
        background: var(--panel-soft);
        color: var(--text);
        border: 1px solid var(--divider);
        border-radius: 12px;
        padding: 12px 14px;
        font-family: inherit;
        font-size: 0.92rem;
        outline: none;
        transition: border 0.22s ease, box-shadow 0.22s ease;
    }

    textarea {
        min-height: 92px;
        resize: vertical;
    }

    input:focus,
    select:focus,
    textarea:focus {
        border-color: var(--blue);
        box-shadow: 0 0 0 2px rgba(123,188,251,0.2);
    }

    .form-actions {
        display: flex;
        gap: 12px;
        flex-wrap: wrap;
    }

    .table-panel {
        background: var(--panel-bg);
        border-radius: 24px;
        border: 1px solid var(--divider);
    }

    .table-header {
        padding: 24px;
        border-bottom: 1px solid var(--divider);
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .table-title {
        font-size: 1rem;
        font-weight: 800;
    }

    .table-action {
        color: var(--blue);
        font-size: 0.78rem;
        font-weight: 700;
    }

    .table-wrap {
        overflow-x: auto;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th {
        padding: 14px 16px;
        text-align: left;
        font-size: 0.74rem;
        font-weight: 800;
        color: var(--muted);
        letter-spacing: 0.16em;
        text-transform: uppercase;
        border-bottom: 1px solid var(--divider);
    }

    td {
        padding: 14px 16px;
        border-bottom: 1px solid var(--divider);
        color: var(--soft-muted);
        font-size: 0.88rem;
    }

    tr:hover td {
        background: rgba(255,255,255,0.035);
    }

    .status {
        display: inline-block;
        padding: 6px 10px;
        border-radius: 12px;
        font-size: 0.72rem;
        font-weight: 900;
        letter-spacing: 0.12em;
    }

    .status.available {
        background: rgba(114, 241, 183, 0.14);
        color: var(--green);
        border: 1px solid var(--green);
    }

    .status.low {
        background: rgba(255, 156, 166, 0.14);
        color: var(--danger);
        border: 1px solid var(--danger);
    }

    .status.order {
        background: rgba(123,188,251,0.14);
        color: var(--blue);
        border: 1px solid var(--blue);
    }

    @media (max-width: 980px) {
        .app-shell {
            flex-direction: column;
        }

        .sidebar {
            position: relative;
            width: 100%;
            min-height: unset;
        }

        .main {
            margin-left: 0;
            width: 100%;
        }

        .stats-grid,
        .content-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
</head>
<body>
    <div class="app-shell">
        <aside class="sidebar">
            <div class="brand-wrap">
                <div class="brand-icon">IM</div>
                <div>
                    <div class="brand-name">Inventory Pro</div>
                    <div class="brand-sub">Warehouse system</div>
                </div>
            </div>

            <div class="sidebar-title">Navigation</div>
            <nav class="menu-list">
                <a class="menu-link active" href="#">Dashboard</a>
                <a class="menu-link" href="#">Products</a>
                <a class="menu-link" href="#">Stock In</a>
                <a class="menu-link" href="#">Stock Out</a>
                <a class="menu-link" href="#">Suppliers</a>
                <a class="menu-link" href="#">Reports</a>
            </nav>

            <div class="sidebar-title">Admin</div>
            <nav class="menu-list">
                <a class="menu-link" href="aboutus.jsp">About Us</a>
                <form action="Logout" method="post">
                    <button type="submit" class="secondary-btn" style="width:100%; margin-top:10px;">Logout</button>
                </form>
            </nav>
        </aside>

        <main class="main">
            <section class="topbar">
                <div>
                    <span class="page-kicker">Inventory Management</span>
                    <h1 class="page-title">Inventory Dashboard</h1>
                </div>
                <div class="topbar-actions">
                    <div class="search-box">
                        <span>⌕</span>
                        <input type="text" placeholder="Search stock">
                    </div>
                    <button class="primary-btn">+ Add Product</button>
                </div>
            </section>

            <section class="stats-grid">
                <article class="stat-card">
                    <div>
                        <div class="label">Total Products</div>
                        <div class="value">248</div>
                        <div class="trend">+12.5% this month</div>
                    </div>
                    <div class="stat-icon">▦</div>
                </article>
                <article class="stat-card">
                    <div>
                        <div class="label">Stock Value</div>
                        <div class="value">$12.8k</div>
                        <div class="trend">+8.2% growth</div>
                    </div>
                    <div class="stat-icon">◇</div>
                </article>
                <article class="stat-card">
                    <div>
                        <div class="label">Low Stock</div>
                        <div class="value">07</div>
                        <div class="trend" style="color: var(--danger);">Needs reorder</div>
                    </div>
                    <div class="stat-icon">!</div>
                </article>
                <article class="stat-card">
                    <div>
                        <div class="label">Orders</div>
                        <div class="value">36</div>
                        <div class="trend">+4 pending</div>
                    </div>
                    <div class="stat-icon">☰</div>
                </article>
            </section>

            <section class="content-grid">
                <section class="panel">
                    <div class="panel-header">
                        <div class="panel-title">Product Details</div>
                        <span class="panel-chip">NEW ENTRY</span>
                    </div>

                    <form action="welcome" method="post" class="inventory-form">
                        <div class="form-grid">
                            <label>
                                Product Name
                                <input type="text" id="productname" name="productname" placeholder="e.g. Office Chair">
                            </label>
                            <label>
                                Invoice Code
                                <input type="text" id="code" name="code" placeholder="e.g. INV-1025">
                            </label>
                            <label>
                                Category
                                <select name="category" id="category">
                                    <option>Electronics</option>
                                    <option>Furniture</option>
                                    <option>Office Supplies</option>
                                    <option>Packaging</option>
                                </select>
                            </label>
                            <label>
                                Supplier
                                <select name="supplier" id="supplier">
                                    <option>Greenline Traders</option>
                                    <option>Metro Supply Co.</option>
                                    <option>Nova Goods</option>
                                </select>
                            </label>
                            <label>
                                Unit Price
                                <input type="number" id="unitprice" name="unitprice" placeholder="450.00">
                            </label>
                            <label>
                                Stock Quantity
                                <input type="number" id="stockquantity" name="stockquantity" placeholder="100">
                            </label>
                            <label>
                                Reorder Level
                                <input type="number" id="reorderlevel" name="reorderlevel" placeholder="25">
                            </label>
                            <label>
                                Warehouse
                                <select name="warehouser" id="warehouser">
                                    <option>Main Warehouse</option>
                                    <option>North Store</option>
                                    <option>South Hub</option>
                                </select>
                            </label>
                            <label style="grid-column: span 2;">
                                Product Description
                                <textarea name="desc" id="desc" placeholder="Short product description"></textarea>
                            </label>
                        </div>

                        <div class="form-actions">
                            <button type="submit" class="primary-btn">Save Product</button>
                            <button type="reset" id="clean" class="secondary-btn">Clear</button>
                        </div>
                    </form>
                </section>

                <section class="table-panel">
                    <div class="table-header">
                        <div class="table-title">Stock Items</div>
                        <a class="table-action" href="#">Export CSV</a>
                    </div>
                    <div class="table-wrap">
                        <table>
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>SKU</th>
                                    <th>Stock</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Office Chair</td>
                                    <td>INV-1025</td>
                                    <td>120</td>
                                    <td><span class="status available">Available</span></td>
                                </tr>
                                <tr>
                                    <td>Printer Ink</td>
                                    <td>INV-2040</td>
                                    <td>08</td>
                                    <td><span class="status low">Low Stock</span></td>
                                </tr>
                                <tr>
                                    <td>Packaging Box</td>
                                    <td>INV-1188</td>
                                    <td>250</td>
                                    <td><span class="status available">Available</span></td>
                                </tr>
                                <tr>
                                    <td>Safety Kit</td>
                                    <td>INV-9001</td>
                                    <td>14</td>
                                    <td><span class="status order">Restock</span></td>
                                </tr>
                                <tr>
                                    <td>USB Dock</td>
                                    <td>INV-7507</td>
                                    <td>42</td>
                                    <td><span class="status available">Available</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </section>
            </section>
        </main>
    </div>

    <%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
 	if(session.getAttribute("email")==null){
        response.sendRedirect("login.jsp");
    }
    %>
</body>
</html>