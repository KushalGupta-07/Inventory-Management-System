<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dynamic Login Portal</title>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    min-height: 100vh;
    background: radial-gradient(circle at top left, #1c1b37 0%, #0d1128 48%, #080c1f 100%);
    color: #f7f8ff;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 20px;
    position: relative;
    overflow: hidden;
}

body::before {
    content: '';
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, rgba(142, 104, 255, 0.18), transparent 30%),
                radial-gradient(circle at top left, rgba(74, 152, 255, 0.12), transparent 22%),
                radial-gradient(circle at bottom right, rgba(255, 95, 180, 0.14), transparent 18%);
    pointer-events: none;
}

body::after {
    content: '';
    position: absolute;
    inset: 0;
    background: repeating-linear-gradient(135deg, rgba(255,255,255,0.02) 0 1px, transparent 1px 24px);
    opacity: 0.15;
    pointer-events: none;
}

.container {
    width: 100%;
    max-width: 420px;
    padding: 42px;
    border-radius: 28px;
    background: rgba(255, 255, 255, 0.06);
    backdrop-filter: blur(26px);
    border: 1px solid rgba(255, 255, 255, 0.15);
    box-shadow: 0 35px 90px rgba(0, 0, 0, 0.35);
    position: relative;
    overflow: hidden;
    animation: popIn 0.8s ease both;
}

.container::before {
    content: '';
    position: absolute;
    inset: 0;
    background: linear-gradient(180deg, rgba(255,255,255,0.05), transparent 60%);
    pointer-events: none;
}

h1 {
    text-align: center;
    color: #ffffff;
    margin-bottom: 28px;
    font-size: 2.4rem;
    font-weight: 700;
    letter-spacing: -0.05em;
    text-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
}

.form-group {
    margin-bottom: 24px;
}

label {
    display: block;
    color: rgba(255, 255, 255, 0.75);
    margin-bottom: 10px;
    font-size: 0.95rem;
    font-weight: 600;
    letter-spacing: 0.03em;
}

input[type="email"], input[type="password"] {
    width: 100%;
    padding: 16px 18px;
    font-size: 0.98rem;
    color: #f4f6ff;
    background: rgba(255, 255, 255, 0.07);
    border: 1px solid rgba(255, 255, 255, 0.14);
    border-radius: 16px;
    outline: none;
    transition: border-color 0.25s ease, background 0.25s ease, transform 0.25s ease;
}

.input-wrap {
    position: relative;
}

.input-wrap input[type="password"],
.input-wrap input[type="email"] {
    padding-right: 50px;
}

.toggle-password {
    position: absolute;
    right: 12px;
    top: 50%;
    transform: translateY(-50%);
    border: none;
    background: transparent;
    color: rgba(255, 255, 255, 0.8);
    cursor: pointer;
    width: 34px;
    height: 34px;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 6px;
    border-radius: 8px;
    transition: background 0.2s ease, color 0.2s ease;
}

.toggle-password:hover {
    background: rgba(255, 255, 255, 0.08);
    color: #ffffff;
}

.toggle-password svg {
    width: 22px;
    height: 22px;
    stroke: currentColor;
    fill: none;
    stroke-width: 2;
    stroke-linecap: round;
    stroke-linejoin: round;
}

.toggle-password .icon-eye-slash {
    display: none;
}

.toggle-password.hidden .icon-eye {
    display: none;
}

.toggle-password.hidden .icon-eye-slash {
    display: block;
}

input[type="email"]:focus,
input[type="password"]:focus {
    background: rgba(255, 255, 255, 0.12);
    border-color: rgba(132, 88, 255, 0.8);
    transform: translateY(-1px);
    box-shadow: 0 0 22px rgba(132, 88, 255, 0.18);
}

input[type="email"]::placeholder,
input[type="password"]::placeholder {
    color: rgba(255, 255, 255, 0.55);
}

.btn {
    width: 100%;
    padding: 16px;
    border: none;
    border-radius: 16px;
    background: linear-gradient(135deg, #7f5cff, #ff5ec3 52%, #59d8ff);
    color: #ffffff;
    font-size: 1rem;
    font-weight: 700;
    cursor: pointer;
    letter-spacing: 0.02em;
    position: relative;
    overflow: hidden;
    transition: transform 0.25s ease, box-shadow 0.25s ease, filter 0.25s ease;
    box-shadow: 0 18px 40px rgba(81, 41, 173, 0.25);
}

.btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 24px 50px rgba(81, 41, 173, 0.28);
    filter: brightness(1.04);
}

.btn:active {
    transform: translateY(-1px);
}

.btn::before {
    content: '';
    position: absolute;
    top: 0;
    left: -110%;
    width: 120%;
    height: 100%;
    background: rgba(255,255,255,0.18);
    transform: skewX(-20deg);
    transition: left 0.6s ease;
}

.btn:hover::before {
    left: 110%;
}

.divider {
    text-align: center;
    margin: 32px 0;
    position: relative;
    color: rgba(255, 255, 255, 0.65);
    font-size: 0.95rem;
}

.divider::before {
    content: '';
    position: absolute;
    top: 50%;
    left: 0;
    right: 0;
    height: 1px;
    background: rgba(255,255,255,0.12);
    transform: translateY(-50%);
}

.divider span {
    background: rgba(8, 14, 35, 0.95);
    padding: 0 18px;
    position: relative;
    z-index: 1;
}

.secondary-btn {
    width: 100%;
    padding: 14px 18px;
    background: rgba(255, 255, 255, 0.08);
    border: 1px solid rgba(255, 255, 255, 0.18);
    border-radius: 16px;
    color: rgba(255, 255, 255, 0.9);
    font-size: 0.98rem;
    font-weight: 600;
    cursor: pointer;
    transition: transform 0.25s ease, background 0.25s ease, border-color 0.25s ease;
}

.secondary-btn:hover {
    background: rgba(255, 255, 255, 0.14);
    border-color: rgba(255, 255, 255, 0.3);
    transform: translateY(-2px);
}

.floating-shapes {
    position: absolute;
    inset: 0;
    overflow: hidden;
    pointer-events: none;
}

.shape {
    position: absolute;
    opacity: 0.12;
    filter: blur(2px);
    animation: float 22s linear infinite;
}

.shape:nth-child(1) {
    width: 160px;
    height: 160px;
    top: 12%;
    left: 8%;
    background: radial-gradient(circle, rgba(123,92,255,0.5), transparent 55%);
}

.shape:nth-child(2) {
    width: 110px;
    height: 110px;
    bottom: 18%;
    right: 14%;
    background: radial-gradient(circle, rgba(255,108,182,0.45), transparent 55%);
}

.shape:nth-child(3) {
    width: 90px;
    height: 90px;
    top: 30%;
    right: 22%;
    background: radial-gradient(circle, rgba(84,196,255,0.42), transparent 60%);
}

@keyframes gradientShift {
    0%, 100% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
}

@keyframes float {
    0% { transform: translateY(0) rotate(0deg); }
    50% { transform: translateY(-28px) rotate(15deg); }
    100% { transform: translateY(0) rotate(0deg); }
}

@keyframes popIn {
    0% { opacity: 0; transform: scale(0.9) translateY(20px); }
    100% { opacity: 1; transform: scale(1) translateY(0); }
}

@keyframes textGlow {
    0% { text-shadow: 0 0 20px rgba(255, 255, 255, 0.15); }
    100% { text-shadow: 0 0 30px rgba(255, 255, 255, 0.32); }
}

@media (max-width: 520px) {
    .container {
        padding: 30px 20px;
        border-radius: 22px;
    }

    h1 {
        font-size: 2rem;
    }

    .btn,
    .secondary-btn,
    input[type="email"],
    input[type="password"] {
        padding: 14px 16px;
    }
}
</style>
</head>
<body>
    <div class="floating-shapes">
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
    </div>
    
    <div class="container">
        <h1>Welcome Back</h1>
        
        <form action="login" method="post">
            <div class="form-group">
                <label for="email">E-mail</label>
                <input type="email" id="email" name="email" placeholder="Enter your E-mail" required>
            </div>
            
            <div class="form-group">
                <label for="pass">Password</label>
                <div class="input-wrap">
                    <input type="password" id="pass" name="pass" placeholder="Enter your password" required>
                    <button type="button" class="toggle-password hidden" aria-label="Show password" title="Show password">
                        <svg class="icon-eye" viewBox="0 0 24 24" aria-hidden="true">
                            <path d="M2 12s3.5-6 10-6 10 6 10 6-3.5 6-10 6S2 12 2 12Z"></path>
                            <circle cx="12" cy="12" r="3"></circle>
                        </svg>
                        <svg class="icon-eye-slash" viewBox="0 0 24 24" aria-hidden="true">
                            <path d="M3 3l18 18"></path>
                            <path d="M10.5 10.5A2.5 2.5 0 0 0 13.5 13.5"></path>
                            <path d="M9.1 5.4A10.7 10.7 0 0 1 12 5c6.5 0 10 7 10 7a17.8 17.8 0 0 1-4.6 5.7"></path>
                            <path d="M6.9 6.9A17.2 17.2 0 0 0 2 12s3.5 7 10 7a11.1 11.1 0 0 0 5.1-1.3"></path>
                        </svg>
                    </button>
                </div>
            </div>
            
            <button type="submit" class="btn">Sign In</button>
        </form>
        
        <div class="divider">
            <span>OR</span>
        </div>
        
        <form action="Signin.jsp" method="post">
            <button type="submit" class="secondary-btn">Create New Account</button>
        </form>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const passwordInput = document.getElementById('pass');
            const toggleButton = document.querySelector('.toggle-password');

            if (passwordInput && toggleButton) {
                toggleButton.addEventListener('click', function () {
                    const isPassword = passwordInput.type === 'password';
                    passwordInput.type = isPassword ? 'email' : 'password';
                    toggleButton.classList.toggle('hidden', !isPassword);
                    toggleButton.setAttribute('aria-label', isPassword ? 'Hide password' : 'Show password');
                    toggleButton.title = isPassword ? 'Hide password' : 'Show password';
                });
            }
        });
    </script>
    
</body>
</html>