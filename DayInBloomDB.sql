-- 1. DB 생성 및 선택
CREATE DATABASE IF NOT EXISTS ELDERLY_HEALTHCARE CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE ELDERLY_HEALTHCARE;

-- 2. users
CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(10) NOT NULL,
    birth_date DATE NOT NULL,
    gender ENUM('남성', '여성') NOT NULL,
    address VARCHAR(127),
    phone_number VARCHAR(15),
    height FLOAT,
    weight FLOAT,
    BMI FLOAT,
    profile_image_url VARCHAR(255),
    profile_image_key VARCHAR(255),
    encodedId VARCHAR(20),
    breakfast_time TIME,
    lunch_time TIME,
    dinner_time TIME,
    kakao_user_id VARCHAR(50),
    role ENUM('senior', 'guardian', 'doctor') NOT NULL,
    login_provider ENUM('fitbit', 'kakao') NOT NULL,
    is_profile_complete BOOLEAN DEFAULT FALSE,
    last_login TIMESTAMP,
    refresh_token TEXT,
    access_token TEXT,
    guardian_code VARCHAR(18) UNIQUE,
    doctor_code VARCHAR(18) UNIQUE,
    status ENUM('active', 'deleted', 'inactive') DEFAULT 'active',
    deleted_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 3. user_alerts
CREATE TABLE user_alerts (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    alert_type ENUM('meal_reminder', 'report_ready', 'morning_alert', 'anomaly_alert', 'advice_alert', 'device_connect', 'device_battery'),
    is_enabled BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 4. guardian_doctor_links
CREATE TABLE guardian_doctor_links (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    senior_id BIGINT NOT NULL,
    role ENUM('guardian', 'doctor') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (senior_id) REFERENCES users(id)
);

-- 5. fitbit_device
CREATE TABLE fitbit_device (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    device_id BIGINT NOT NULL,
    device_version VARCHAR(50),
    battery_level VARCHAR(50),
    last_sync_time TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 6. daily_missions
CREATE TABLE daily_missions (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    date DATE NOT NULL,
    mission_quiz BOOLEAN DEFAULT FALSE,
    mission_report BOOLEAN DEFAULT FALSE,
    mission_exercise BOOLEAN DEFAULT FALSE,
    mission_sleep BOOLEAN DEFAULT FALSE,
    completed_count INT DEFAULT 0,
    marker_type ENUM('none', 'seed', 'sprout', 'leaf', 'flowerbud', 'flower') DEFAULT 'none',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE(user_id, date),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 7. health_checkup_summary
CREATE TABLE health_checkup_summary (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    checkup_date DATE,
    height FLOAT,
    weight FLOAT,
    bmi FLOAT,
    blood_pressure VARCHAR(10),
    fasting_blood_sugar FLOAT,
    total_cholesterol FLOAT,
    hdl_cholesterol FLOAT,
    ldl_cholesterol FLOAT,
    triglyceride FLOAT,
    gfr FLOAT,
    ast FLOAT,
    alt FLOAT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 8. health_checkup_records
CREATE TABLE health_checkup_records (
    user_id BIGINT NOT NULL,
    checkup_data JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 9. notifications
CREATE TABLE notifications (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    notification_type VARCHAR(50),
    message TEXT,
    triggered_by VARCHAR(50),
    sent_at TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE,
    is_push_sent BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 10. health_analyzer
CREATE TABLE health_analyzer (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    analysis_type ENUM('gpt', 'threshold'),
    triggered_alert BOOLEAN DEFAULT FALSE,
    analysis_timestamp TIMESTAMP,
    trigger_details TEXT,
    notification_id BIGINT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (notification_id) REFERENCES notifications(id)
);

-- 11. qna_info
CREATE TABLE qna_info (
    user_id BIGINT NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    date DATE NOT NULL,
    question TEXT NOT NULL,
    multiple_choice_response TEXT NOT NULL,
    text_response TEXT,
    gpt_qna_analysis TEXT NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(user_id, date),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 12. daily_health_reports
CREATE TABLE daily_health_reports (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    report_date DATE NOT NULL,
    report_status ENUM('pending', 'completed') DEFAULT 'pending',
    overall_health_score FLOAT,
    stress_score FLOAT,
    total_exercise_time INT,
    total_sleep_time INT,
    avg_exercise_time FLOAT,
    avg_heart_rate FLOAT,
    calories_burned FLOAT,
    sleep_score FLOAT,
    spo2_variation FLOAT,
    sleep_heart_rate FLOAT,
    exercise_gpt_analysis TEXT,
    sleep_gpt_analysis TEXT,
    exercise_graph_path VARCHAR(255),
    sleep_heartrate_path VARCHAR(255),
    sleep_zone_graph_path VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 13. health_reports_pdf
CREATE TABLE health_reports_pdf (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    report_id BIGINT NOT NULL,
    report_date DATE NOT NULL,
    basic_pdf_key VARCHAR(255),
    doctor_pdf_key VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (report_id) REFERENCES daily_health_reports(id)
);


-- 14. fitbit_activity_data
CREATE TABLE fitbit_activity_data (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    date DATETIME NOT NULL,
    steps INT NOT NULL,
    distance_km FLOAT NOT NULL,
    calories_total FLOAT,
    heart_rate FLOAT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_user_time (user_id, date),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 15. fitbit_activity_summary
CREATE TABLE fitbit_activity_summary (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    date DATETIME NOT NULL,
    averageDailySteps FLOAT DEFAULT NULL,
    rhr FLOAT DEFAULT NULL,
    total_steps INT,
    total_distance FLOAT,
    total_calories_out FLOAT,
    total_activity_calories FLOAT,
    caloriesBMR FLOAT,
    marginalCalories FLOAT,
    sedentary_minutes INT,
    lightly_active_minutes INT,
    fairly_active_minutes INT,
    very_active_minutes INT,
    out_of_range_minutes INT,
    fat_burn_minutes INT,
    cardio_minutes INT,
    peak_minutes INT,
    out_of_range_calories INT,
    fat_burn_calories INT,
    cardio_calories INT,
    peak_calories INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_user_time (user_id, date),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 16. fitbit_health_metrics
CREATE TABLE fitbit_health_metrics (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    date DATETIME NOT NULL,
    daily_hrv FLOAT DEFAULT NULL,
    sleep_hrv FLOAT DEFAULT NULL,
    breathing_rate FLOAT DEFAULT NULL,
    skin_temperature FLOAT DEFAULT NULL,
    stress_score FLOAT DEFAULT NULL,
    hrv_contribution FLOAT DEFAULT NULL,
    rhr_contribution FLOAT DEFAULT NULL,
    sleep_contribution FLOAT DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_user_time (user_id, date),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 17. fitbit_average
CREATE TABLE fitbit_average (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    recorded_at DATE NOT NULL,
    period_type ENUM('1D', '7D', '30D', '90D', '180D', '365D') NOT NULL,
    avg_steps INT,
    avg_calories_total FLOAT,
    avg_distance_km FLOAT,
    avg_floors INT,
    avg_heart_rate FLOAT,
    avg_resting_heart_rate INT,
    avg_activity_duration FLOAT,
    avg_sedentary_minutes INT,
    avg_lightly_active_minutes INT,
    avg_fairly_active_minutes INT,
    avg_very_active_minutes INT,
    avg_total_sleep_hours INT,
    avg_deep_sleep_hours FLOAT,
    avg_light_sleep_hours FLOAT,
    avg_rem_sleep_hours FLOAT,
    avg_awake_hours FLOAT,
    avg_sleep_heart_rate FLOAT,
    avg_sleep_breathing_rate FLOAT,
    avg_sleep_spo2 FLOAT,
    avg_spo2 FLOAT,
    avg_hrv FLOAT,
    avg_rhr FLOAT,
    avg_respiratory_rate FLOAT,
    avg_skin_temperature FLOAT,
    avg_stress_score FLOAT,
    avg_readiness_score FLOAT,
    avg_sleep_score FLOAT NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (user_id, recorded_at, period_type),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 18. fitbit_sleep_data
CREATE TABLE fitbit_sleep_data (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    date DATE NOT NULL,
    startTime DATETIME NOT NULL,
    endTime DATETIME NOT NULL,
    total_sleep_minutes FLOAT NOT NULL,
    deep_sleep_hours FLOAT NOT NULL,
    light_sleep_hours FLOAT NOT NULL,
    rem_sleep_hours FLOAT NOT NULL,
    minutesAwake FLOAT NOT NULL,
    awakeningsCount INT DEFAULT 0,
    awakeCount INT NOT NULL,
    awakeDuration INT DEFAULT 0,
    restlessCount INT NOT NULL,
    restlessDuration INT DEFAULT 0,
    logId INT,
    timeinBed INT,
    minutesAsleep INT,
    efficiency FLOAT NOT NULL,
    duration FLOAT NOT NULL,
    quality FLOAT NOT NULL,
    isMainSleep BOOLEAN NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_user_time (user_id, startTime),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 19. comments
CREATE TABLE comments (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    report_id BIGINT NOT NULL,
    author_id BIGINT NOT NULL,
    role ENUM('guardian', 'doctor') NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE (report_id, author_id, role),
    FOREIGN KEY (report_id) REFERENCES daily_health_reports(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

-- 20. s3_bucket
CREATE TABLE s3_bucket (
    file_key VARCHAR(255) PRIMARY KEY,
    bucket_name VARCHAR(50),
    url VARCHAR(255),
    storage_class VARCHAR(50),
    file_type ENUM('pdf', 'image') NOT NULL,
    category ENUM('basic_report', 'doctor_report', 'exercise_graph', 'sleep_graph', 'sleep_heart_graph', 'sleep_pattern_graph') NOT NULL,
    related_report_id BIGINT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (related_report_id) REFERENCES daily_health_reports(id)
);

-- 21. fitbit_average_history
CREATE TABLE fitbit_average_history (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    recorded_at DATE NOT NULL,
    period_type ENUM('30D', '90D', '180D', '365D') NOT NULL,
    avg_steps INT DEFAULT NULL,
    avg_calories_total FLOAT DEFAULT NULL,
    avg_distance_km FLOAT DEFAULT NULL,
    avg_floors INT DEFAULT NULL,
    avg_heart_rate FLOAT DEFAULT NULL,
    avg_resting_heart_rate INT DEFAULT NULL,
    avg_activity_duration FLOAT DEFAULT NULL,
    avg_sedentary_minutes INT DEFAULT NULL,
    avg_lightly_active_minutes INT DEFAULT NULL,
    avg_fairly_active_minutes INT DEFAULT NULL,
    avg_very_active_minutes INT DEFAULT NULL,
    avg_total_sleep_hours INT DEFAULT NULL,
    avg_deep_sleep_hours FLOAT DEFAULT NULL,
    avg_light_sleep_hours FLOAT DEFAULT NULL,
    avg_rem_sleep_hours FLOAT DEFAULT NULL,
    avg_awake_hours FLOAT DEFAULT NULL,
    avg_sleep_heart_rate FLOAT DEFAULT NULL,
    avg_sleep_breathing_rate FLOAT DEFAULT NULL,
    avg_sleep_spo2 FLOAT DEFAULT NULL,
    avg_spo2 FLOAT DEFAULT NULL,
    avg_hrv FLOAT DEFAULT NULL,
    avg_rhr FLOAT DEFAULT NULL,
    avg_respiratory_rate FLOAT DEFAULT NULL,
    avg_skin_temperature FLOAT DEFAULT NULL,
    avg_stress_score FLOAT DEFAULT NULL,
    avg_readiness_score FLOAT DEFAULT NULL,
    avg_sleep_score FLOAT NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (user_id, recorded_at, period_type),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 22. device_tokens
CREATE TABLE device_tokens (
    id INT AUTO_INCREMENT PRIMARY KEY,           
    user_id INT NOT NULL,                       
    fcm_token VARCHAR(255) NOT NULL,             
    platform ENUM('ios', 'android', 'web') NOT NULL, 
    is_active BOOLEAN DEFAULT TRUE,            
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
    UNIQUE (user_id, fcm_token)              
);
