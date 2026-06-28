<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Classroom Hub Pro</title>
    <style>
        :root {
            --bg-main: #0d1117;
            --bg-sidebar: #161b22;
            --border-color: #30363d;
            --text-main: #c9d1d9;
            --text-bright: #f0f6fc;
            --text-muted: #8b949e;
            --accent-green: #238636;
            --accent-green-hover: #2ea043;
            --accent-blue: #58a6ff;
            --accent-red: #f85149;
        }

        body {
            margin: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            background-color: var(--bg-main);
            color: var(--text-main);
            display: flex;
            height: 100vh;
            overflow: hidden;
        }

        /* Sidebar Styling */
        .sidebar {
            width: 280px;
            background-color: var(--bg-sidebar);
            border-right: 1px solid var(--border-color);
            display: flex;
            flex-direction: column;
        }

        .sidebar-header {
            padding: 24px 20px;
            font-size: 1.25rem;
            font-weight: 700;
            color: var(--text-bright);
            border-bottom: 1px solid var(--border-color);
            letter-spacing: 0.5px;
        }

        .channels {
            padding: 15px 10px;
            flex-grow: 1;
            overflow-y: auto;
        }

        .channel-btn {
            display: flex;
            align-items: center;
            width: 100%;
            padding: 10px 14px;
            background: none;
            border: none;
            color: var(--text-muted);
            text-align: left;
            font-size: 0.95rem;
            cursor: pointer;
            border-radius: 6px;
            margin-bottom: 4px;
            transition: all 0.15s ease-in-out;
        }

        .channel-btn:hover {
            background-color: #21262d;
            color: var(--text-bright);
        }

        .channel-btn.active {
            background-color: var(--accent-green);
            color: #ffffff;
            font-weight: 600;
        }

        .channel-hash {
            margin-right: 10px;
            color: var(--text-muted);
            font-weight: normal;
        }
        .channel-btn.active .channel-hash {
            color: rgba(255,255,255,0.7);
        }

        /* Authentication Panel at Bottom of Sidebar */
        .auth-section {
            padding: 20px;
            border-top: 1px solid var(--border-color);
            background-color: #090c10;
        }

        .status-badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 0.75rem;
            font-weight: 600;
            text-transform: uppercase;
            margin-bottom: 12px;
            background-color: #21262d;
            color: var(--text-muted);
        }
        .status-badge.officer {
            background-color: rgba(56, 139, 253, 0.15);
            color: var(--accent-blue);
            border: 1px solid rgba(56, 139, 253, 0.4);
        }

        .auth-input-container {
            display: flex;
            gap: 6px;
        }

        .auth-input {
            flex-grow: 1;
            padding: 8px 12px;
            background-color: var(--bg-main);
            border: 1px solid var(--border-color);
            border-radius: 6px;
            color: var(--text-bright);
            font-size: 0.85rem;
        }
        .auth-input:focus {
            outline: none;
            border-color: var(--accent-blue);
        }

        .auth-btn {
            background-color: #21262d;
            border: 1px solid var(--border-color);
            color: var(--text-bright);
            padding: 0 12px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 0.85rem;
            transition: background-color 0.2s;
        }
        .auth-btn:hover {
            background-color: #30363d;
        }

        /* Main Content Viewport */
        .main-content {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            background-color: var(--bg-main);
        }

        .main-header {
            padding: 22px 30px;
            background-color: var(--bg-sidebar);
            border-bottom: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .main-header h2 {
            margin: 0;
            color: var(--text-bright);
            font-size: 1.4rem;
        }

        /* Feed Stream Layout */
        .feed {
            flex-grow: 1;
            padding: 30px;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .post-card {
            background-color: var(--bg-sidebar);
            border: 1px solid var(--border-color);
            border-radius: 8px;
            padding: 24px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            transition: transform 0.2s;
        }
        .post-card:hover {
            transform: translateY(-2px);
        }

        .post-header-row {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 12px;
        }

        .post-card h3 {
            margin: 0;
            color: var(--text-bright);
            font-size: 1.25rem;
        }

        .type-tag {
            font-size: 0.75rem;
            padding: 3px 8px;
            border-radius: 12px;
            font-weight: 600;
            background-color: #1f6feb;
            color: white;
        }

        .post-meta-strip {
            display: flex;
            gap: 16px;
            font-size: 0.85rem;
            color: var(--text-muted);
            margin-bottom: 16px;
            border-bottom: 1px solid #21262d;
            padding-bottom: 10px;
        }

        .due-indicator {
            color: #e3b341;
            font-weight: 500;
        }

        .post-body {
            line-height: 1.6;
            white-space: pre-wrap;
            color: #adbac7;
        }

        /* Administrative Creator Form */
        .form-container {
            padding: 24px 30px;
            background-color: var(--bg-sidebar);
            border-top: 1px solid var(--border-color);
            display: none;
        }

        .form-row-grid {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr;
            gap: 12px;
            margin-bottom: 12px;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            box-sizing: border-box;
            background-color: var(--bg-main);
            color: var(--text-bright);
            border: 1px solid var(--border-color);
            border-radius: 6px;
            font-family: inherit;
            font-size: 0.95rem;
        }
        .form-control:focus {
            outline: none;
            border-color: var(--accent-blue);
        }

        textarea.form-control {
            resize: vertical;
            height: 100px;
            margin-bottom: 12px;
        }

        .submit-btn {
            background-color: var(--accent-green);
            color: white;
            border: none;
            padding: 12px 24px;
            font-size: 0.95rem;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.15s;
        }
        .submit-btn:hover {
            background-color: var(--accent-green-hover);
        }

        .empty-state {
            text-align: center;
            color: var(--text-muted);
            margin-top: 60px;
            font-style: italic;
            font-size: 1.05rem;
        }
    </style>
</head>
<body>

    <div class="sidebar">
        <div class="sidebar-header">🎒 Classroom Hub</div>
        <div class="channels" id="channelList">
            <button class="channel-btn active" onclick="switchChannel('MAPEH')"><span class="channel-hash">#</span> MAPEH</button>
            <button class="channel-btn" onclick="switchChannel('Filipino')"><span class="channel-hash">#</span> Filipino</button>
            <button class="channel-btn" onclick="switchChannel('English')"><span class="channel-hash">#</span> English</button>
            <button class="channel-btn" onclick="switchChannel('Arpan')"><span class="channel-hash">#</span> Arpan</button>
            <button class="channel-btn" onclick="switchChannel('Science')"><span class="channel-hash">#</span> Science</button>
            <button class="channel-btn" onclick="switchChannel('Math')"><span class="channel-hash">#</span> Math</button>
            <button class="channel-btn" onclick="switchChannel('VAL-ED')"><span class="channel-hash">#</span> VAL-ED</button>
            <button class="channel-btn" onclick="switchChannel('TLE')"><span class="channel-hash">#</span> TLE</button>
        </div>
        
        <div class="auth-section">
            <div id="statusBadge" class="status-badge">Student View Only</div>
            <div class="auth-input-container" id="authInputWrapper">
                <input type="password" id="officerKeyInput" class="auth-input" placeholder="Enter Officer Key...">
                <button onclick="verifyOfficerKey()" class="auth-btn">Verify</button>
            </div>
        </div>
    </div>

    <div class="main-content">
        <div class="main-header">
            <h2 id="currentChannelTitle"># MAPEH</h2>
        </div>

        <div class="feed" id="feedBox">
            <div class="empty-state">Establishing encrypted database sync...</div>
        </div>

        <div class="form-container" id="postFormContainer">
            <form id="assignmentForm">
                <div class="form-row-grid">
                    <input type="text" id="postTitle" class="form-control" placeholder="Assignment or Project Title..." required>
                    <input type="text" id="postDueDate" class="form-control" placeholder="Due Date (e.g., Oct 24)" required>
                    <select id="postType" class="form-control">
                        <option value="Homework">Homework</option>
                        <option value="Project">Project</option>
                        <option value="Quiz">Quiz Study</option>
                        <option value="Announcement">Announcement</option>
                    </select>
                </div>
                <textarea id="postBody" class="form-control" placeholder="Write instructions, links, criteria, or scope details here..." required></textarea>
                <button type="submit" class="submit-btn">Publish to Stream</button>
            </form>
        </div>
    </div>

    <script type="module">
        import { initializeApp } from "https://www.gstatic.com/firebasejs/10.8.0/firebase-app.js";
        import { getFirestore, collection, addDoc, query, where, orderBy, onSnapshot, serverTimestamp } from "https://www.gstatic.com/firebasejs/10.8.0/firebase-firestore.js";

        // 1. paste your real configuration data from Google Firebase dashboard here:
        const firebaseConfig = {
            apiKey: "YOUR_API_KEY",
            authDomain: "YOUR_PROJECT_ID.firebaseapp.com",
            projectId: "YOUR_PROJECT_ID",
            storageBucket: "YOUR_PROJECT_ID.appspot.com",
            messagingSenderId: "YOUR_SENDER_ID",
            appId: "YOUR_APP_ID"
        };

        // 2. CHOOSE YOUR PRIVATE SECRET OFFICER KEY BELOW (Change "Amethyst2026" to whatever you want)
        const SECRET_OFFICER_KEY = "Amethyst2026";

        // Initialization
        const app = initializeApp(firebaseConfig);
        const db = getFirestore(app);

        let currentChannel = 'MAPEH';
        let isOfficer = false;
        let unsubscribe = null;

        // Verify Key Function
        window.verifyOfficerKey = function() {
            const input = document.getElementById('officerKeyInput').value;
            const badge = document.getElementById('statusBadge');
            const formBox = document.getElementById('postFormContainer');
            const wrapper = document.getElementById('authInputWrapper');

            if (input === SECRET_OFFICER_KEY) {
                isOfficer = true;
                badge.innerText = "⭐ Authorized Officer";
                badge.className = "status-badge officer";
                formBox.style.display = "block";
                wrapper.innerHTML = `<span style="color:var(--text-muted); font-size:0.85rem;">Access granted. Ready to publish.</span>`;
            } else {
                alert("Incorrect Officer Key. Access Denied.");
            }
        }

        // Realtime Streaming Engine Loop Hook
        function syncStream(channelName) {
            if (unsubscribe) unsubscribe();

            const feedBox = document.getElementById('feedBox');
            const q = query(
                collection(db, "assignments"),
                where("channel", "==", channelName),
                orderBy("timestamp", "desc")
            );

            unsubscribe = onSnapshot(q, (snapshot) => {
                feedBox.innerHTML = '';

                if(snapshot.empty) {
                    feedBox.innerHTML = `<div class="empty-state">No current postings listed under #${channelName}.</div>`;
                    return;
                }

                snapshot.forEach((doc) => {
                    const post = doc.data();
                    let timestampText = "Just now";
                    if (post.timestamp) {
                        timestampText = post.timestamp.toDate().toLocaleDateString('en-US', {
                            month: 'short', day: 'numeric', hour: '2-digit', minute: '2-digit'
                        });
                    }

                    const card = document.createElement('div');
                    card.className = 'post-card';
                    card.innerHTML = `
                        <div class="post-header-row">
                            <h3>${escapeHTML(post.title)}</h3>
                            <span class="type-tag">${escapeHTML(post.type || 'Task')}</span>
                        </div>
                        <div class="post-meta-strip">
                            <span>📅 Posted: ${timestampText}</span>
                            <span class="due-indicator">⚠️ Due: ${escapeHTML(post.dueDate)}</span>
                        </div>
                        <div class="post-body">${escapeHTML(post.body)}</div>
                    `;
                    feedBox.appendChild(card);
                });
            }, (error) => {
                console.error(error);
                feedBox.innerHTML = `<div class="empty-state" style="color:var(--accent-red)">Sync Failure. Confirm configuration arrays inside script header.</div>`;
            });
        }

        // Global Switching Wrapper Hook
        window.switchChannel = function(channelName) {
            currentChannel = channelName;
            document.getElementById('currentChannelTitle').innerText = `# ${channelName}`;

            const buttons = document.querySelectorAll('.channel-btn');
            buttons.forEach(btn => {
                if (btn.innerText.trim().endsWith(channelName)) {
                    btn.classList.add('active');
                } else {
                    btn.classList.remove('active');
                }
            });

            syncStream(channelName);
        }

        // Database Injection Framework 
        document.getElementById('assignmentForm').addEventListener('submit', async (e) => {
            e.preventDefault();
            if (!isOfficer) return;

            const title = document.getElementById('postTitle');
            const dueDate = document.getElementById('postDueDate');
            const type = document.getElementById('postType');
            const body = document.getElementById('postBody');

            try {
                await addDoc(collection(db, "assignments"), {
                    title: title.value,
                    dueDate: dueDate.value,
                    type: type.value,
                    body: body.value,
                    channel: currentChannel,
                    timestamp: serverTimestamp()
                });

                title.value = '';
                dueDate.value = '';
                body.value = '';
            } catch (err) {
                alert("Cloud submission block error: " + err.message);
            }
        });

        function escapeHTML(str) {
            return str.replace(/[&<>'"]/g, tag => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', "'": '&#39;', '"': '&quot;' }[tag] || tag));
        }

        // Initial Engine Spin-up
        syncStream(currentChannel);
    </script>
</body>
</html>
