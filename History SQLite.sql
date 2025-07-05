--- 24-04-2025 19:26:48 dairy_complaints.db
CREATE TABLE complaints (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    worker_name TEXT NOT NULL,
    complaint_text TEXT NOT NULL,
    priority TEXT NOT NULL,
    date_submitted TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



