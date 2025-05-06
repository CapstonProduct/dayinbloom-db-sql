-- 1. users
INSERT INTO users (
    id, username, birth_date, gender, address, phone_number, height, weight,
    profile_image_url, profile_image_key, encodedId, breakfast_time, lunch_time, dinner_time,
    kakao_user_id, role, login_provider, is_profile_complete, last_login,
    guardian_code, doctor_code
) VALUES
(1, '김영수', '1948-10-12', '남성', '서울시 종로구', '010-1234-5678', 165.2, 62.5,
 NULL, NULL, 'CJBPPL', '07:30:00', '12:30:00', '18:00:00',
 NULL, 'senior', 'fitbit', TRUE, NOW(), 'GUARD123', 'DOCTOR678'),

(2, '이수민', '1980-05-05', '여성', '경기도 성남시', '010-2345-6789', 160.0, 55.0,
 NULL, NULL, NULL, NULL, NULL, NULL,
 'kakao_guardian_01', 'guardian', 'kakao', TRUE, NOW(), NULL, NULL),

(3, '박지훈', '1975-08-20', '남자', '서울시 강남구', '010-3456-7890', 175.0, 70.0,
 NULL, NULL, NULL, NULL, NULL, NULL,
 'kakao_doctor_01', 'doctor', 'kakao', TRUE, NOW(), NULL, NULL);

-- 2. user_alerts
INSERT INTO user_alerts (user_id, alert_type, is_enabled) VALUES
(1, 'meal_reminder', TRUE),
(1, 'report_ready', TRUE),
(1, 'morning_alert', TRUE),
(1, 'anomaly_alert', TRUE);

-- 3. guardian_doctor_links (already included)
INSERT INTO guardian_doctor_links (user_id, senior_id, role) VALUES
(2, 1, 'guardian'),
(3, 1, 'doctor');

-- 4. fitbit_device
INSERT INTO fitbit_device (user_id, device_id, device_version, battery_level, last_sync_time) 
VALUES (1, 1001, 'Charge 5', '89%', NOW());

-- 5. daily_missions
INSERT INTO daily_missions (user_id, date, mission_quiz, mission_report, mission_exercise, mission_sleep, completed_count, marker_type)
VALUES (1, '2025-04-01', TRUE, TRUE, TRUE, TRUE, 4, 'flowerbud');

-- 6. health_checkup_summary
INSERT INTO health_checkup_summary (user_id, checkup_date, height, weight, bmi, blood_pressure, fasting_blood_sugar, total_cholesterol,
hdl_cholesterol, ldl_cholesterol, triglyceride, gfr, ast, alt)
VALUES (1, '2025-01-01', 165.2, 62.5, 22.9, '120/80', 95.5, 190.5, 55.5, 100.2, 135.3, 90.1, 25.4, 30.1);

-- 7. health_checkup_records
INSERT INTO health_checkup_records (user_id, checkup_data)
VALUES (1, '{"blood_pressure":"120/80","bmi":22.9,"height":165.2,"weight":62.5,"fasting_blood_sugar":95.5,"total_cholesterol":190.5,"hdl_cholesterol":55.5,"ldl_cholesterol":100.2,"triglyceride":135.3,"gfr":90.1,"ast":25.4,"alt":30.1}');

-- 8. notifications (already included)
INSERT INTO notifications (
    user_id, notification_type, message, triggered_by, sent_at,
    is_read, is_push_sent
) VALUES
(1, 'report_ready', '1월 17일 건강 리포트가 생성되었습니다!', 'system', '2025-01-17 08:00:00', FALSE, TRUE),
(1, 'morning_alert', '주무실 시간입니다. 오늘 하루 수고하셨습니다!', 'system', '2025-01-17 22:00:00', FALSE, TRUE),
(1, 'meal_reminder', '저녁 식사를 하실 시간입니다!', 'system', '2025-01-17 18:30:00', FALSE, TRUE),
(1, 'meal_reminder', '점심 식사를 하실 시간입니다!', 'system', '2025-01-17 12:30:00', FALSE, TRUE),
(1, 'meal_reminder', '아침 식사를 하실 시간입니다!', 'system', '2025-01-17 07:30:00', FALSE, TRUE),
(1, 'anomaly_alert', '심박수에서 이상이 감지되었습니다.', 'system', '2025-01-17 15:45:00', FALSE, TRUE),
(1, 'advice_alert', '일어서기 목표를 달성했습니다!', 'system', '2025-01-16 14:00:00', TRUE, TRUE),
(1, 'advice_alert', '일어 설 시간입니다. 몸을 일분 동안 움직이세요!', 'system', '2025-01-16 10:15:00', TRUE, TRUE),
(1, 'anomaly_alert', '심박수가 높습니다. 안정을 취하세요!', 'system', '2025-01-16 09:30:00', TRUE, TRUE),
(1, 'report_ready', '1월 16일 건강 리포트가 생성되었습니다!', 'system', '2025-01-16 08:00:00', TRUE, TRUE),
(1, 'morning_alert', '주무실 시간입니다. 오늘 하루 수고하셨습니다!', 'system', '2025-01-16 22:00:00', TRUE, TRUE),
(1, 'meal_reminder', '저녁 식사를 하실 시간입니다!', 'system', '2025-01-16 18:30:00', TRUE, TRUE),
(1, 'meal_reminder', '점심 식사를 하실 시간입니다!', 'system', '2025-01-16 12:30:00', TRUE, TRUE);

-- 9. health_analyzer
INSERT INTO health_analyzer (user_id, analysis_type, triggered_alert, analysis_timestamp, trigger_details, notification_id)
VALUES (1, 'threshold', TRUE, NOW(), '수면 시간 부족', 1);

-- 10. qna_info
INSERT INTO qna_info (user_id, timestamp, date, question, multiple_choice_response, text_response, gpt_qna_analysis)
VALUES (1, NOW(), '2025-04-01', '오늘 식사 후 소화 상태는 어떠신가요?', '아주 좋음', '야채를 많이 먹었다.', '어르신께서 야채가 포함된 건강한 식사를 하셨군요! 건강한 식습관을 유지하면 좋습니다.');

-- 11. daily_health_reports
INSERT INTO daily_health_reports 
(user_id, report_date, report_status, overall_health_score, stress_score, total_exercise_time, total_sleep_time, avg_exercise_time, avg_heart_rate, calories_burned, sleep_score, spo2_variation, sleep_heart_rate, exercise_gpt_analysis, sleep_gpt_analysis, exercise_graph_path, sleep_heartrate_path, sleep_zone_graph_path) 
VALUES
(1, '2025-04-01', 'completed', 85, 10, 116, 360, 38.67, 103, 450, 74, 95, 59, '운동에 대한 분석: 운동 시간은 116분으로 적당하며, 심박수는 103bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 6시간이며, 수면의 질이 74점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250401.png', '/path/to/sleep_heartrate_1_20250401.png', '/path/to/sleep_zone_graph_1_20250401.png'),
(1, '2025-04-02', 'completed', 96, 9, 103, 540, 34.33, 66, 364, 79, 96, 57, '운동에 대한 분석: 운동 시간은 103분으로 적당하며, 심박수는 66bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 9시간이며, 수면의 질이 79점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250402.png', '/path/to/sleep_heartrate_1_20250402.png', '/path/to/sleep_zone_graph_1_20250402.png'),
(1, '2025-04-03', 'completed', 84, 4, 94, 540, 31.33, 119, 578, 64, 100, 75, '운동에 대한 분석: 운동 시간은 94분으로 적당하며, 심박수는 119bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 9시간이며, 수면의 질이 64점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250403.png', '/path/to/sleep_heartrate_1_20250403.png', '/path/to/sleep_zone_graph_1_20250403.png'),
(1, '2025-04-04', 'completed', 77, 4, 76, 540, 25.33, 87, 635, 91, 96, 69, '운동에 대한 분석: 운동 시간은 76분으로 적당하며, 심박수는 87bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 9시간이며, 수면의 질이 91점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250404.png', '/path/to/sleep_heartrate_1_20250404.png', '/path/to/sleep_zone_graph_1_20250404.png'),
(1, '2025-04-05', 'completed', 85, 9, 111, 540, 37.00, 103, 435, 84, 98, 89, '운동에 대한 분석: 운동 시간은 111분으로 적당하며, 심박수는 103bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 9시간이며, 수면의 질이 84점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250405.png', '/path/to/sleep_heartrate_1_20250405.png', '/path/to/sleep_zone_graph_1_20250405.png'),
(1, '2025-04-06', 'completed', 95, 4, 60, 420, 20.00, 82, 728, 92, 98, 63, '운동에 대한 분석: 운동 시간은 60분으로 적당하며, 심박수는 82bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 7시간이며, 수면의 질이 92점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250406.png', '/path/to/sleep_heartrate_1_20250406.png', '/path/to/sleep_zone_graph_1_20250406.png'),
(1, '2025-04-07', 'completed', 99, 6, 49, 300, 16.33, 115, 713, 85, 95, 65, '운동에 대한 분석: 운동 시간은 49분으로 적당하며, 심박수는 115bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 5시간이며, 수면의 질이 85점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250407.png', '/path/to/sleep_heartrate_1_20250407.png', '/path/to/sleep_zone_graph_1_20250407.png'),
(1, '2025-04-08', 'completed', 65, 10, 117, 300, 39.00, 63, 295, 85, 97, 50, '운동에 대한 분석: 운동 시간은 117분으로 적당하며, 심박수는 63bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 5시간이며, 수면의 질이 85점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250408.png', '/path/to/sleep_heartrate_1_20250408.png', '/path/to/sleep_zone_graph_1_20250408.png'),
(1, '2025-04-09', 'completed', 88, 9, 90, 360, 30.00, 73, 496, 69, 99, 53, '운동에 대한 분석: 운동 시간은 90분으로 적당하며, 심박수는 73bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 6시간이며, 수면의 질이 69점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250409.png', '/path/to/sleep_heartrate_1_20250409.png', '/path/to/sleep_zone_graph_1_20250409.png'),
(1, '2025-04-10', 'completed', 80, 7, 102, 480, 34.00, 112, 233, 74, 100, 81, '운동에 대한 분석: 운동 시간은 102분으로 적당하며, 심박수는 112bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 8시간이며, 수면의 질이 74점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250410.png', '/path/to/sleep_heartrate_1_20250410.png', '/path/to/sleep_zone_graph_1_20250410.png'),
(1, '2025-04-11', 'completed', 78, 8, 107, 360, 35.67, 72, 288, 88, 98, 82, '운동에 대한 분석: 운동 시간은 107분으로 적당하며, 심박수는 72bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 6시간이며, 수면의 질이 88점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250411.png', '/path/to/sleep_heartrate_1_20250411.png', '/path/to/sleep_zone_graph_1_20250411.png'),
(1, '2025-04-12', 'completed', 99, 3, 62, 360, 20.67, 100, 609, 98, 99, 84, '운동에 대한 분석: 운동 시간은 62분으로 적당하며, 심박수는 100bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 6시간이며, 수면의 질이 98점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250412.png', '/path/to/sleep_heartrate_1_20250412.png', '/path/to/sleep_zone_graph_1_20250412.png'),
(1, '2025-04-13', 'completed', 100, 7, 39, 300, 13.00, 95, 573, 63, 95, 51, '운동에 대한 분석: 운동 시간은 39분으로 적당하며, 심박수는 95bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 5시간이며, 수면의 질이 63점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250413.png', '/path/to/sleep_heartrate_1_20250413.png', '/path/to/sleep_zone_graph_1_20250413.png'),
(1, '2025-04-14', 'completed', 92, 7, 66, 300, 22.00, 68, 621, 74, 97, 64, '운동에 대한 분석: 운동 시간은 66분으로 적당하며, 심박수는 68bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 5시간이며, 수면의 질이 74점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250414.png', '/path/to/sleep_heartrate_1_20250414.png', '/path/to/sleep_zone_graph_1_20250414.png'),
(1, '2025-04-15', 'completed', 69, 9, 106, 300, 35.33, 74, 262, 74, 96, 85, '운동에 대한 분석: 운동 시간은 106분으로 적당하며, 심박수는 74bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 5시간이며, 수면의 질이 74점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250415.png', '/path/to/sleep_heartrate_1_20250415.png', '/path/to/sleep_zone_graph_1_20250415.png'),
(1, '2025-04-16', 'completed', 81, 10, 102, 480, 34.00, 74, 514, 69, 96, 56, '운동에 대한 분석: 운동 시간은 102분으로 적당하며, 심박수는 74bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 8시간이며, 수면의 질이 69점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250416.png', '/path/to/sleep_heartrate_1_20250416.png', '/path/to/sleep_zone_graph_1_20250416.png'),
(1, '2025-04-17', 'completed', 66, 6, 64, 360, 21.33, 89, 605, 72, 96, 59, '운동에 대한 분석: 운동 시간은 64분으로 적당하며, 심박수는 89bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 6시간이며, 수면의 질이 72점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250417.png', '/path/to/sleep_heartrate_1_20250417.png', '/path/to/sleep_zone_graph_1_20250417.png'),
(1, '2025-04-18', 'completed', 97, 7, 91, 360, 30.33, 60, 390, 62, 99, 67, '운동에 대한 분석: 운동 시간은 91분으로 적당하며, 심박수는 60bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 6시간이며, 수면의 질이 62점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250418.png', '/path/to/sleep_heartrate_1_20250418.png', '/path/to/sleep_zone_graph_1_20250418.png'),
(1, '2025-04-19', 'completed', 81, 3, 64, 360, 21.33, 65, 518, 76, 96, 86, '운동에 대한 분석: 운동 시간은 64분으로 적당하며, 심박수는 65bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 6시간이며, 수면의 질이 76점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250419.png', '/path/to/sleep_heartrate_1_20250419.png', '/path/to/sleep_zone_graph_1_20250419.png'),
(1, '2025-04-20', 'completed', 83, 8, 87, 300, 29.00, 77, 543, 80, 99, 61, '운동에 대한 분석: 운동 시간은 87분으로 적당하며, 심박수는 77bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 5시간이며, 수면의 질이 80점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250420.png', '/path/to/sleep_heartrate_1_20250420.png', '/path/to/sleep_zone_graph_1_20250420.png'),
(1, '2025-04-21', 'completed', 93, 9, 66, 540, 22.00, 62, 528, 67, 99, 72, '운동에 대한 분석: 운동 시간은 66분으로 적당하며, 심박수는 62bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 9시간이며, 수면의 질이 67점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250421.png', '/path/to/sleep_heartrate_1_20250421.png', '/path/to/sleep_zone_graph_1_20250421.png'),
(1, '2025-04-22', 'completed', 65, 6, 68, 540, 22.67, 62, 736, 94, 97, 89, '운동에 대한 분석: 운동 시간은 68분으로 적당하며, 심박수는 62bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 9시간이며, 수면의 질이 94점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250422.png', '/path/to/sleep_heartrate_1_20250422.png', '/path/to/sleep_zone_graph_1_20250422.png'),
(1, '2025-04-23', 'completed', 93, 9, 91, 480, 30.33, 74, 715, 96, 98, 69, '운동에 대한 분석: 운동 시간은 91분으로 적당하며, 심박수는 74bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 8시간이며, 수면의 질이 96점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250423.png', '/path/to/sleep_heartrate_1_20250423.png', '/path/to/sleep_zone_graph_1_20250423.png'),
(1, '2025-04-24', 'completed', 78, 3, 61, 480, 20.33, 83, 577, 70, 96, 79, '운동에 대한 분석: 운동 시간은 61분으로 적당하며, 심박수는 83bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 8시간이며, 수면의 질이 70점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250424.png', '/path/to/sleep_heartrate_1_20250424.png', '/path/to/sleep_zone_graph_1_20250424.png'),
(1, '2025-04-25', 'completed', 60, 9, 48, 480, 16.00, 60, 356, 89, 98, 67, '운동에 대한 분석: 운동 시간은 48분으로 적당하며, 심박수는 60bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 8시간이며, 수면의 질이 89점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250425.png', '/path/to/sleep_heartrate_1_20250425.png', '/path/to/sleep_zone_graph_1_20250425.png'),
(1, '2025-04-26', 'completed', 62, 7, 51, 540, 17.00, 78, 656, 100, 95, 54, '운동에 대한 분석: 운동 시간은 51분으로 적당하며, 심박수는 78bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 9시간이며, 수면의 질이 100점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250426.png', '/path/to/sleep_heartrate_1_20250426.png', '/path/to/sleep_zone_graph_1_20250426.png'),
(1, '2025-04-27', 'completed', 68, 8, 37, 540, 12.33, 61, 247, 67, 98, 74, '운동에 대한 분석: 운동 시간은 37분으로 적당하며, 심박수는 61bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 9시간이며, 수면의 질이 67점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250427.png', '/path/to/sleep_heartrate_1_20250427.png', '/path/to/sleep_zone_graph_1_20250427.png'),
(1, '2025-04-28', 'completed', 83, 8, 65, 300, 21.67, 111, 325, 63, 98, 69, '운동에 대한 분석: 운동 시간은 65분으로 적당하며, 심박수는 111bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 5시간이며, 수면의 질이 63점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250428.png', '/path/to/sleep_heartrate_1_20250428.png', '/path/to/sleep_zone_graph_1_20250428.png'),
(1, '2025-04-29', 'completed', 60, 2, 74, 360, 24.67, 106, 583, 77, 100, 70, '운동에 대한 분석: 운동 시간은 74분으로 적당하며, 심박수는 106bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 6시간이며, 수면의 질이 77점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250429.png', '/path/to/sleep_heartrate_1_20250429.png', '/path/to/sleep_zone_graph_1_20250429.png'),
(1, '2025-04-30', 'completed', 93, 5, 47, 480, 15.67, 65, 561, 87, 95, 54, '운동에 대한 분석: 운동 시간은 47분으로 적당하며, 심박수는 65bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 8시간이며, 수면의 질이 87점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250430.png', '/path/to/sleep_heartrate_1_20250430.png', '/path/to/sleep_zone_graph_1_20250430.png'),
(1, '2025-05-01', 'completed', 72, 10, 102, 300, 34.00, 100, 744, 73, 98, 54, '운동에 대한 분석: 운동 시간은 102분으로 적당하며, 심박수는 100bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 5시간이며, 수면의 질이 73점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250501.png', '/path/to/sleep_heartrate_1_20250501.png', '/path/to/sleep_zone_graph_1_20250501.png'),
(1, '2025-05-02', 'completed', 85, 10, 35, 480, 11.67, 119, 704, 87, 98, 87, '운동에 대한 분석: 운동 시간은 35분으로 적당하며, 심박수는 119bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 8시간이며, 수면의 질이 87점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250502.png', '/path/to/sleep_heartrate_1_20250502.png', '/path/to/sleep_zone_graph_1_20250502.png'),
(1, '2025-05-03', 'completed', 56, 2, 101, 300, 33.67, 119, 654, 98, 95, 75, '운동에 대한 분석: 운동 시간은 101분으로 적당하며, 심박수는 119bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 5시간이며, 수면의 질이 98점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250503.png', '/path/to/sleep_heartrate_1_20250503.png', '/path/to/sleep_zone_graph_1_20250503.png'),
(1, '2025-05-04', 'completed', 73, 6, 98, 480, 32.67, 89, 460, 94, 100, 83, '운동에 대한 분석: 운동 시간은 98분으로 적당하며, 심박수는 89bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 8시간이며, 수면의 질이 94점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250504.png', '/path/to/sleep_heartrate_1_20250504.png', '/path/to/sleep_zone_graph_1_20250504.png'),
(1, '2025-05-05', 'completed', 90, 7, 88, 540, 29.33, 97, 691, 97, 99, 51, '운동에 대한 분석: 운동 시간은 88분으로 적당하며, 심박수는 97bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 9시간이며, 수면의 질이 97점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250505.png', '/path/to/sleep_heartrate_1_20250505.png', '/path/to/sleep_zone_graph_1_20250505.png'),
(1, '2025-05-06', 'completed', 82, 4, 46, 540, 15.33, 74, 313, 81, 98, 87, '운동에 대한 분석: 운동 시간은 46분으로 적당하며, 심박수는 74bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 9시간이며, 수면의 질이 81점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250506.png', '/path/to/sleep_heartrate_1_20250506.png', '/path/to/sleep_zone_graph_1_20250506.png'),
(1, '2025-05-07', 'completed', 91, 8, 114, 300, 38.00, 84, 785, 89, 97, 70, '운동에 대한 분석: 운동 시간은 114분으로 적당하며, 심박수는 84bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 5시간이며, 수면의 질이 89점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250507.png', '/path/to/sleep_heartrate_1_20250507.png', '/path/to/sleep_zone_graph_1_20250507.png'),
(1, '2025-05-08', 'completed', 59, 6, 110, 360, 36.67, 117, 338, 67, 97, 63, '운동에 대한 분석: 운동 시간은 110분으로 적당하며, 심박수는 117bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 6시간이며, 수면의 질이 67점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250508.png', '/path/to/sleep_heartrate_1_20250508.png', '/path/to/sleep_zone_graph_1_20250508.png'),
(1, '2025-05-09', 'completed', 61, 3, 119, 360, 39.67, 89, 461, 94, 95, 83, '운동에 대한 분석: 운동 시간은 119분으로 적당하며, 심박수는 89bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 6시간이며, 수면의 질이 94점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250509.png', '/path/to/sleep_heartrate_1_20250509.png', '/path/to/sleep_zone_graph_1_20250509.png'),
(1, '2025-05-10', 'completed', 54, 9, 117, 540, 39.00, 79, 363, 62, 95, 66, '운동에 대한 분석: 운동 시간은 117분으로 적당하며, 심박수는 79bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 9시간이며, 수면의 질이 62점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250510.png', '/path/to/sleep_heartrate_1_20250510.png', '/path/to/sleep_zone_graph_1_20250510.png'),
(1, '2025-05-11', 'completed', 59, 5, 55, 300, 18.33, 78, 436, 84, 100, 62, '운동에 대한 분석: 운동 시간은 55분으로 적당하며, 심박수는 78bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 5시간이며, 수면의 질이 84점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250511.png', '/path/to/sleep_heartrate_1_20250511.png', '/path/to/sleep_zone_graph_1_20250511.png'),
(1, '2025-05-12', 'completed', 82, 3, 30, 540, 10.00, 114, 691, 64, 96, 63, '운동에 대한 분석: 운동 시간은 30분으로 적당하며, 심박수는 114bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 9시간이며, 수면의 질이 64점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250512.png', '/path/to/sleep_heartrate_1_20250512.png', '/path/to/sleep_zone_graph_1_20250512.png'),
(1, '2025-05-13', 'completed', 82, 1, 111, 480, 37.00, 111, 719, 63, 97, 63, '운동에 대한 분석: 운동 시간은 111분으로 적당하며, 심박수는 111bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 8시간이며, 수면의 질이 63점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250513.png', '/path/to/sleep_heartrate_1_20250513.png', '/path/to/sleep_zone_graph_1_20250513.png'),
(1, '2025-05-14', 'completed', 67, 8, 76, 420, 25.33, 71, 691, 69, 99, 59, '운동에 대한 분석: 운동 시간은 76분으로 적당하며, 심박수는 71bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 7시간이며, 수면의 질이 69점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250514.png', '/path/to/sleep_heartrate_1_20250514.png', '/path/to/sleep_zone_graph_1_20250514.png'),
(1, '2025-05-15', 'completed', 100, 4, 40, 480, 13.33, 77, 353, 60, 95, 78, '운동에 대한 분석: 운동 시간은 40분으로 적당하며, 심박수는 77bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 8시간이며, 수면의 질이 60점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250515.png', '/path/to/sleep_heartrate_1_20250515.png', '/path/to/sleep_zone_graph_1_20250515.png'),
(1, '2025-05-16', 'completed', 72, 6, 43, 420, 14.33, 95, 352, 83, 96, 89, '운동에 대한 분석: 운동 시간은 43분으로 적당하며, 심박수는 95bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 7시간이며, 수면의 질이 83점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250516.png', '/path/to/sleep_heartrate_1_20250516.png', '/path/to/sleep_zone_graph_1_20250516.png'),
(1, '2025-05-17', 'completed', 63, 6, 58, 360, 19.33, 71, 528, 70, 97, 64, '운동에 대한 분석: 운동 시간은 58분으로 적당하며, 심박수는 71bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 6시간이며, 수면의 질이 70점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250517.png', '/path/to/sleep_heartrate_1_20250517.png', '/path/to/sleep_zone_graph_1_20250517.png'),
(1, '2025-05-18', 'completed', 91, 8, 112, 480, 37.33, 65, 222, 94, 100, 55, '운동에 대한 분석: 운동 시간은 112분으로 적당하며, 심박수는 65bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 8시간이며, 수면의 질이 94점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250518.png', '/path/to/sleep_heartrate_1_20250518.png', '/path/to/sleep_zone_graph_1_20250518.png'),
(1, '2025-05-19', 'completed', 51, 1, 100, 300, 33.33, 77, 543, 63, 98, 78, '운동에 대한 분석: 운동 시간은 100분으로 적당하며, 심박수는 77bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 5시간이며, 수면의 질이 63점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250519.png', '/path/to/sleep_heartrate_1_20250519.png', '/path/to/sleep_zone_graph_1_20250519.png'),
(1, '2025-05-20', 'completed', 95, 9, 83, 480, 27.67, 104, 774, 70, 100, 58, '운동에 대한 분석: 운동 시간은 83분으로 적당하며, 심박수는 104bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 8시간이며, 수면의 질이 70점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250520.png', '/path/to/sleep_heartrate_1_20250520.png', '/path/to/sleep_zone_graph_1_20250520.png'),
(1, '2025-05-21', 'completed', 60, 6, 35, 420, 11.67, 101, 218, 94, 95, 61, '운동에 대한 분석: 운동 시간은 35분으로 적당하며, 심박수는 101bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 7시간이며, 수면의 질이 94점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250521.png', '/path/to/sleep_heartrate_1_20250521.png', '/path/to/sleep_zone_graph_1_20250521.png'),
(1, '2025-05-22', 'completed', 88, 1, 46, 420, 15.33, 70, 540, 65, 96, 87, '운동에 대한 분석: 운동 시간은 46분으로 적당하며, 심박수는 70bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 7시간이며, 수면의 질이 65점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250522.png', '/path/to/sleep_heartrate_1_20250522.png', '/path/to/sleep_zone_graph_1_20250522.png'),
(1, '2025-05-23', 'completed', 87, 3, 81, 420, 27.00, 72, 596, 72, 95, 59, '운동에 대한 분석: 운동 시간은 81분으로 적당하며, 심박수는 72bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 7시간이며, 수면의 질이 72점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250523.png', '/path/to/sleep_heartrate_1_20250523.png', '/path/to/sleep_zone_graph_1_20250523.png'),
(1, '2025-05-24', 'completed', 74, 10, 44, 480, 14.67, 91, 239, 100, 95, 54, '운동에 대한 분석: 운동 시간은 44분으로 적당하며, 심박수는 91bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 8시간이며, 수면의 질이 100점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250524.png', '/path/to/sleep_heartrate_1_20250524.png', '/path/to/sleep_zone_graph_1_20250524.png'),
(1, '2025-05-25', 'completed', 79, 7, 78, 480, 26.00, 60, 778, 88, 97, 67, '운동에 대한 분석: 운동 시간은 78분으로 적당하며, 심박수는 60bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 8시간이며, 수면의 질이 88점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250525.png', '/path/to/sleep_heartrate_1_20250525.png', '/path/to/sleep_zone_graph_1_20250525.png'),
(1, '2025-05-26', 'completed', 82, 7, 37, 480, 12.33, 90, 778, 94, 95, 79, '운동에 대한 분석: 운동 시간은 37분으로 적당하며, 심박수는 90bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 8시간이며, 수면의 질이 94점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250526.png', '/path/to/sleep_heartrate_1_20250526.png', '/path/to/sleep_zone_graph_1_20250526.png'),
(1, '2025-05-27', 'completed', 55, 7, 54, 360, 18.00, 99, 562, 78, 99, 67, '운동에 대한 분석: 운동 시간은 54분으로 적당하며, 심박수는 99bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 6시간이며, 수면의 질이 78점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250527.png', '/path/to/sleep_heartrate_1_20250527.png', '/path/to/sleep_zone_graph_1_20250527.png'),
(1, '2025-05-28', 'completed', 79, 3, 99, 360, 33.00, 74, 324, 62, 96, 77, '운동에 대한 분석: 운동 시간은 99분으로 적당하며, 심박수는 74bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 6시간이며, 수면의 질이 62점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250528.png', '/path/to/sleep_heartrate_1_20250528.png', '/path/to/sleep_zone_graph_1_20250528.png'),
(1, '2025-05-29', 'completed', 50, 4, 96, 540, 32.00, 80, 526, 79, 96, 79, '운동에 대한 분석: 운동 시간은 96분으로 적당하며, 심박수는 80bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 9시간이며, 수면의 질이 79점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250529.png', '/path/to/sleep_heartrate_1_20250529.png', '/path/to/sleep_zone_graph_1_20250529.png'),
(1, '2025-05-30', 'completed', 50, 5, 71, 480, 23.67, 119, 574, 81, 98, 63, '운동에 대한 분석: 운동 시간은 71분으로 적당하며, 심박수는 119bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 8시간이며, 수면의 질이 81점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250530.png', '/path/to/sleep_heartrate_1_20250530.png', '/path/to/sleep_zone_graph_1_20250530.png'),
(1, '2025-05-31', 'completed', 87, 10, 79, 480, 26.33, 99, 781, 97, 100, 79, '운동에 대한 분석: 운동 시간은 79분으로 적당하며, 심박수는 99bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 8시간이며, 수면의 질이 97점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250531.png', '/path/to/sleep_heartrate_1_20250531.png', '/path/to/sleep_zone_graph_1_20250531.png'),
(1, '2025-06-01', 'completed', 92, 9, 109, 300, 36.33, 107, 703, 78, 96, 73, '운동에 대한 분석: 운동 시간은 109분으로 적당하며, 심박수는 107bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 5시간이며, 수면의 질이 78점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250601.png', '/path/to/sleep_heartrate_1_20250601.png', '/path/to/sleep_zone_graph_1_20250601.png'),
(1, '2025-06-02', 'completed', 65, 7, 99, 420, 33.00, 93, 330, 71, 97, 72, '운동에 대한 분석: 운동 시간은 99분으로 적당하며, 심박수는 93bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 7시간이며, 수면의 질이 71점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250602.png', '/path/to/sleep_heartrate_1_20250602.png', '/path/to/sleep_zone_graph_1_20250602.png'),
(1, '2025-06-03', 'completed', 72, 2, 110, 360, 36.67, 81, 440, 66, 95, 75, '운동에 대한 분석: 운동 시간은 110분으로 적당하며, 심박수는 81bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 6시간이며, 수면의 질이 66점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250603.png', '/path/to/sleep_heartrate_1_20250603.png', '/path/to/sleep_zone_graph_1_20250603.png'),
(1, '2025-06-04', 'completed', 68, 8, 115, 300, 38.33, 61, 492, 71, 95, 66, '운동에 대한 분석: 운동 시간은 115분으로 적당하며, 심박수는 61bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 5시간이며, 수면의 질이 71점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250604.png', '/path/to/sleep_heartrate_1_20250604.png', '/path/to/sleep_zone_graph_1_20250604.png'),
(1, '2025-06-05', 'completed', 77, 3, 54, 540, 18.00, 62, 751, 94, 97, 54, '운동에 대한 분석: 운동 시간은 54분으로 적당하며, 심박수는 62bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 9시간이며, 수면의 질이 94점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250605.png', '/path/to/sleep_heartrate_1_20250605.png', '/path/to/sleep_zone_graph_1_20250605.png'),
(1, '2025-06-06', 'completed', 54, 2, 86, 480, 28.67, 68, 270, 89, 95, 84, '운동에 대한 분석: 운동 시간은 86분으로 적당하며, 심박수는 68bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 8시간이며, 수면의 질이 89점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250606.png', '/path/to/sleep_heartrate_1_20250606.png', '/path/to/sleep_zone_graph_1_20250606.png'),
(1, '2025-06-07', 'completed', 76, 6, 113, 540, 37.67, 115, 668, 86, 100, 64, '운동에 대한 분석: 운동 시간은 113분으로 적당하며, 심박수는 115bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 9시간이며, 수면의 질이 86점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250607.png', '/path/to/sleep_heartrate_1_20250607.png', '/path/to/sleep_zone_graph_1_20250607.png'),
(1, '2025-06-08', 'completed', 99, 4, 92, 300, 30.67, 67, 573, 97, 96, 63, '운동에 대한 분석: 운동 시간은 92분으로 적당하며, 심박수는 67bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 5시간이며, 수면의 질이 97점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250608.png', '/path/to/sleep_heartrate_1_20250608.png', '/path/to/sleep_zone_graph_1_20250608.png'),
(1, '2025-06-09', 'completed', 88, 2, 73, 360, 24.33, 117, 412, 96, 96, 58, '운동에 대한 분석: 운동 시간은 73분으로 적당하며, 심박수는 117bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 6시간이며, 수면의 질이 96점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250609.png', '/path/to/sleep_heartrate_1_20250609.png', '/path/to/sleep_zone_graph_1_20250609.png'),
(1, '2025-06-10', 'completed', 98, 2, 74, 540, 24.67, 74, 752, 97, 95, 80, '운동에 대한 분석: 운동 시간은 74분으로 적당하며, 심박수는 74bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 9시간이며, 수면의 질이 97점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250610.png', '/path/to/sleep_heartrate_1_20250610.png', '/path/to/sleep_zone_graph_1_20250610.png'),
(1, '2025-06-11', 'completed', 85, 2, 37, 420, 12.33, 111, 609, 70, 98, 84, '운동에 대한 분석: 운동 시간은 37분으로 적당하며, 심박수는 111bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 7시간이며, 수면의 질이 70점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250611.png', '/path/to/sleep_heartrate_1_20250611.png', '/path/to/sleep_zone_graph_1_20250611.png'),
(1, '2025-06-12', 'completed', 84, 9, 56, 480, 18.67, 96, 347, 97, 96, 80, '운동에 대한 분석: 운동 시간은 56분으로 적당하며, 심박수는 96bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 8시간이며, 수면의 질이 97점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250612.png', '/path/to/sleep_heartrate_1_20250612.png', '/path/to/sleep_zone_graph_1_20250612.png'),
(1, '2025-06-13', 'completed', 54, 10, 65, 420, 21.67, 66, 290, 89, 100, 63, '운동에 대한 분석: 운동 시간은 65분으로 적당하며, 심박수는 66bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 7시간이며, 수면의 질이 89점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250613.png', '/path/to/sleep_heartrate_1_20250613.png', '/path/to/sleep_zone_graph_1_20250613.png'),
(1, '2025-06-14', 'completed', 51, 8, 109, 360, 36.33, 117, 480, 90, 98, 82, '운동에 대한 분석: 운동 시간은 109분으로 적당하며, 심박수는 117bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 6시간이며, 수면의 질이 90점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250614.png', '/path/to/sleep_heartrate_1_20250614.png', '/path/to/sleep_zone_graph_1_20250614.png'),
(1, '2025-06-15', 'completed', 86, 8, 44, 300, 14.67, 101, 783, 75, 96, 74, '운동에 대한 분석: 운동 시간은 44분으로 적당하며, 심박수는 101bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 5시간이며, 수면의 질이 75점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250615.png', '/path/to/sleep_heartrate_1_20250615.png', '/path/to/sleep_zone_graph_1_20250615.png'),
(1, '2025-06-16', 'completed', 90, 7, 89, 360, 29.67, 61, 361, 86, 98, 59, '운동에 대한 분석: 운동 시간은 89분으로 적당하며, 심박수는 61bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 6시간이며, 수면의 질이 86점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250616.png', '/path/to/sleep_heartrate_1_20250616.png', '/path/to/sleep_zone_graph_1_20250616.png'),
(1, '2025-06-17', 'completed', 60, 8, 69, 480, 23.00, 111, 756, 91, 96, 52, '운동에 대한 분석: 운동 시간은 69분으로 적당하며, 심박수는 111bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 8시간이며, 수면의 질이 91점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250617.png', '/path/to/sleep_heartrate_1_20250617.png', '/path/to/sleep_zone_graph_1_20250617.png'),
(1, '2025-06-18', 'completed', 52, 5, 106, 540, 35.33, 77, 264, 71, 99, 68, '운동에 대한 분석: 운동 시간은 106분으로 적당하며, 심박수는 77bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 9시간이며, 수면의 질이 71점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250618.png', '/path/to/sleep_heartrate_1_20250618.png', '/path/to/sleep_zone_graph_1_20250618.png'),
(1, '2025-06-19', 'completed', 64, 5, 72, 480, 24.00, 91, 505, 75, 100, 51, '운동에 대한 분석: 운동 시간은 72분으로 적당하며, 심박수는 91bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 8시간이며, 수면의 질이 75점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250619.png', '/path/to/sleep_heartrate_1_20250619.png', '/path/to/sleep_zone_graph_1_20250619.png'),
(1, '2025-06-20', 'completed', 55, 1, 86, 360, 28.67, 64, 270, 81, 100, 66, '운동에 대한 분석: 운동 시간은 86분으로 적당하며, 심박수는 64bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 6시간이며, 수면의 질이 81점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250620.png', '/path/to/sleep_heartrate_1_20250620.png', '/path/to/sleep_zone_graph_1_20250620.png'),
(1, '2025-06-21', 'completed', 92, 5, 59, 300, 19.67, 73, 659, 84, 96, 88, '운동에 대한 분석: 운동 시간은 59분으로 적당하며, 심박수는 73bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 5시간이며, 수면의 질이 84점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250621.png', '/path/to/sleep_heartrate_1_20250621.png', '/path/to/sleep_zone_graph_1_20250621.png'),
(1, '2025-06-22', 'completed', 67, 4, 56, 420, 18.67, 103, 694, 84, 95, 54, '운동에 대한 분석: 운동 시간은 56분으로 적당하며, 심박수는 103bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 7시간이며, 수면의 질이 84점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250622.png', '/path/to/sleep_heartrate_1_20250622.png', '/path/to/sleep_zone_graph_1_20250622.png'),
(1, '2025-06-23', 'completed', 81, 1, 92, 420, 30.67, 84, 233, 72, 98, 61, '운동에 대한 분석: 운동 시간은 92분으로 적당하며, 심박수는 84bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 7시간이며, 수면의 질이 72점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250623.png', '/path/to/sleep_heartrate_1_20250623.png', '/path/to/sleep_zone_graph_1_20250623.png'),
(1, '2025-06-24', 'completed', 56, 1, 96, 300, 32.00, 119, 392, 81, 97, 53, '운동에 대한 분석: 운동 시간은 96분으로 적당하며, 심박수는 119bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 5시간이며, 수면의 질이 81점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250624.png', '/path/to/sleep_heartrate_1_20250624.png', '/path/to/sleep_zone_graph_1_20250624.png'),
(1, '2025-06-25', 'completed', 90, 8, 117, 300, 39.00, 114, 469, 72, 100, 50, '운동에 대한 분석: 운동 시간은 117분으로 적당하며, 심박수는 114bpm을 기록하였습니다.', '수면 분석: 총 수면 시간은 5시간이며, 수면의 질이 72점으로 안정적인 상태입니다.', '/path/to/exercise_graph_1_20250625.png', '/path/to/sleep_heartrate_1_20250625.png', '/path/to/sleep_zone_graph_1_20250625.png');

-- 12. health_reports_pdf
INSERT INTO health_reports_pdf (user_id, report_id, report_date, basic_pdf_key, doctor_pdf_key)
VALUES (1, 1, '2025-04-01', '건강리포트_2025-05-07_김영수.pdf', '건강리포트_2025-05-07_김영수.pdf');

-- 13. fitbit_activity_data
INSERT INTO fitbit_activity_data (user_id, date, steps, distance_km, calories_total, heart_rate) VALUES
(1, '2025-05-07 00:00:00', 161, 0.18, 5, 66),
(1, '2025-05-07 00:15:00', 129, 0.11, 8, 99),
(1, '2025-05-07 00:30:00', 121, 0.13, 10, 66),
(1, '2025-05-07 00:45:00', 174, 0.13, 7, 68),
(1, '2025-05-07 01:00:00', 127, 0.11, 5, 77),
(1, '2025-05-07 01:15:00', 191, 0.12, 7, 80),
(1, '2025-05-07 01:30:00', 136, 0.15, 8, 92),
(1, '2025-05-07 01:45:00', 197, 0.15, 8, 79),
(1, '2025-05-07 02:00:00', 176, 0.18, 9, 74),
(1, '2025-05-07 02:15:00', 112, 0.11, 6, 60),
(1, '2025-05-07 02:30:00', 169, 0.12, 9, 68),
(1, '2025-05-07 02:45:00', 102, 0.12, 6, 74),
(1, '2025-05-07 03:00:00', 167, 0.11, 10, 88),
(1, '2025-05-07 03:15:00', 150, 0.19, 9, 74),
(1, '2025-05-07 03:30:00', 191, 0.17, 8, 87),
(1, '2025-05-07 03:45:00', 105, 0.2, 9, 61),
(1, '2025-05-07 04:00:00', 194, 0.14, 6, 68),
(1, '2025-05-07 04:15:00', 192, 0.1, 9, 67),
(1, '2025-05-07 04:30:00', 155, 0.14, 7, 94),
(1, '2025-05-07 04:45:00', 197, 0.19, 8, 78),
(1, '2025-05-07 05:00:00', 105, 0.17, 7, 80),
(1, '2025-05-07 05:15:00', 158, 0.14, 8, 83),
(1, '2025-05-07 05:30:00', 193, 0.17, 5, 91),
(1, '2025-05-07 05:45:00', 137, 0.18, 10, 68),
(1, '2025-05-07 06:00:00', 120, 0.16, 8, 82),
(1, '2025-05-07 06:15:00', 111, 0.14, 7, 68),
(1, '2025-05-07 06:30:00', 100, 0.15, 9, 86),
(1, '2025-05-07 06:45:00', 113, 0.14, 10, 70),
(1, '2025-05-07 07:00:00', 171, 0.16, 6, 66),
(1, '2025-05-07 07:15:00', 142, 0.12, 10, 73),
(1, '2025-05-07 07:30:00', 160, 0.14, 6, 98),
(1, '2025-05-07 07:45:00', 200, 0.17, 7, 97),
(1, '2025-05-07 08:00:00', 107, 0.14, 5, 92),
(1, '2025-05-07 08:15:00', 118, 0.12, 8, 89),
(1, '2025-05-07 08:30:00', 100, 0.19, 7, 86),
(1, '2025-05-07 08:45:00', 150, 0.1, 8, 76),
(1, '2025-05-07 09:00:00', 123, 0.1, 5, 89),
(1, '2025-05-07 09:15:00', 146, 0.18, 8, 94),
(1, '2025-05-07 09:30:00', 179, 0.17, 10, 94),
(1, '2025-05-07 09:45:00', 199, 0.14, 6, 85),
(1, '2025-05-07 10:00:00', 184, 0.17, 5, 63),
(1, '2025-05-07 10:15:00', 119, 0.18, 6, 99),
(1, '2025-05-07 10:30:00', 200, 0.1, 7, 90),
(1, '2025-05-07 10:45:00', 140, 0.12, 9, 65),
(1, '2025-05-07 11:00:00', 113, 0.13, 10, 96),
(1, '2025-05-07 11:15:00', 198, 0.17, 5, 64),
(1, '2025-05-07 11:30:00', 176, 0.18, 10, 86),
(1, '2025-05-07 11:45:00', 197, 0.15, 9, 61),
(1, '2025-05-07 12:00:00', 133, 0.15, 6, 69),
(1, '2025-05-07 12:15:00', 109, 0.1, 10, 60),
(1, '2025-05-07 12:30:00', 134, 0.13, 10, 82),
(1, '2025-05-07 12:45:00', 143, 0.18, 9, 74),
(1, '2025-05-07 13:00:00', 183, 0.12, 5, 86),
(1, '2025-05-07 13:15:00', 126, 0.16, 5, 69),
(1, '2025-05-07 13:30:00', 106, 0.14, 7, 99),
(1, '2025-05-07 13:45:00', 185, 0.13, 5, 94),
(1, '2025-05-07 14:00:00', 105, 0.13, 8, 72),
(1, '2025-05-07 14:15:00', 119, 0.19, 6, 75),
(1, '2025-05-07 14:30:00', 183, 0.18, 5, 70),
(1, '2025-05-07 14:45:00', 136, 0.12, 8, 98),
(1, '2025-05-07 15:00:00', 180, 0.16, 9, 66),
(1, '2025-05-07 15:15:00', 198, 0.18, 5, 62),
(1, '2025-05-07 15:30:00', 159, 0.17, 7, 72),
(1, '2025-05-07 15:45:00', 149, 0.19, 5, 74),
(1, '2025-05-07 16:00:00', 113, 0.19, 5, 96),
(1, '2025-05-07 16:15:00', 109, 0.2, 10, 76),
(1, '2025-05-07 16:30:00', 187, 0.1, 7, 65),
(1, '2025-05-07 16:45:00', 169, 0.12, 7, 70),
(1, '2025-05-07 17:00:00', 111, 0.12, 6, 90),
(1, '2025-05-07 17:15:00', 100, 0.16, 6, 73),
(1, '2025-05-07 17:30:00', 144, 0.14, 8, 83),
(1, '2025-05-07 17:45:00', 165, 0.11, 8, 65),
(1, '2025-05-07 18:00:00', 123, 0.11, 8, 96),
(1, '2025-05-07 18:15:00', 114, 0.16, 5, 64),
(1, '2025-05-07 18:30:00', 136, 0.2, 7, 74),
(1, '2025-05-07 18:45:00', 126, 0.12, 7, 81),
(1, '2025-05-07 19:00:00', 179, 0.14, 9, 75),
(1, '2025-05-07 19:15:00', 160, 0.16, 8, 73),
(1, '2025-05-07 19:30:00', 147, 0.16, 5, 80),
(1, '2025-05-07 19:45:00', 180, 0.14, 5, 95),
(1, '2025-05-07 20:00:00', 185, 0.12, 5, 96),
(1, '2025-05-07 20:15:00', 198, 0.16, 7, 67),
(1, '2025-05-07 20:30:00', 152, 0.17, 8, 88),
(1, '2025-05-07 20:45:00', 171, 0.14, 10, 60),
(1, '2025-05-07 21:00:00', 103, 0.17, 9, 97),
(1, '2025-05-07 21:15:00', 175, 0.15, 7, 65),
(1, '2025-05-07 21:30:00', 122, 0.19, 9, 98),
(1, '2025-05-07 21:45:00', 163, 0.18, 8, 66),
(1, '2025-05-07 22:00:00', 108, 0.19, 5, 100),
(1, '2025-05-07 22:15:00', 154, 0.14, 6, 66),
(1, '2025-05-07 22:30:00', 184, 0.18, 6, 82),
(1, '2025-05-07 22:45:00', 119, 0.2, 7, 84),
(1, '2025-05-07 23:00:00', 158, 0.11, 8, 63),
(1, '2025-05-07 23:15:00', 148, 0.15, 6, 100),
(1, '2025-05-07 23:30:00', 132, 0.13, 7, 97),
(1, '2025-05-07 23:45:00', 175, 0.16, 6, 97);

-- 14. fitbit_activity_summary
INSERT INTO fitbit_activity_summary (
    user_id, date, averageDailySteps, rhr, total_steps, total_distance,
    total_calories_out, total_activity_calories, caloriesBMR, marginalCalories,
    sedentary_minutes, lightly_active_minutes, fairly_active_minutes, very_active_minutes,
    out_of_range_minutes, fat_burn_minutes, cardio_minutes, peak_minutes,
    out_of_range_calories, fat_burn_calories, cardio_calories, peak_calories
)
VALUES
(1, '2025-05-01 00:00:00', 8123.5, 60, 8500, 6.8, 2500, 450, 2000, 50, 600, 120, 60, 45, 500, 30, 20, 10, 1200, 800, 350, 150),
(1, '2025-05-02 00:00:00', 7890.0, 62, 8000, 6.5, 2450, 430, 1980, 40, 620, 100, 55, 35, 490, 25, 18, 12, 1150, 780, 340, 160),
(1, '2025-05-03 00:00:00', 8500.2, 58, 9000, 7.1, 2600, 480, 2020, 60, 580, 110, 65, 50, 510, 28, 22, 15, 1220, 810, 360, 170),
(1, '2025-05-04 00:00:00', 7600.8, 61, 7800, 6.2, 2400, 420, 1950, 30, 640, 90, 50, 40, 495, 24, 19, 13, 1100, 770, 330, 140),
(1, '2025-05-05 00:00:00', 9001.1, 59, 9500, 7.4, 2700, 500, 2050, 70, 560, 130, 70, 55, 520, 32, 24, 18, 1250, 830, 370, 180);

-- 15. fitbit_health_metrics
INSERT INTO fitbit_health_metrics (
    user_id, date, daily_hrv, sleep_hrv, breathing_rate,
    skin_temperature, stress_score, hrv_contribution,
    rhr_contribution, sleep_contribution
)
VALUES
(1, '2025-05-01 00:00:00', 45.3, 50.1, 16.2, 0.4, 65.0, 20.0, 25.0, 20.0),
(1, '2025-05-02 00:00:00', 48.7, 52.4, 15.8, 0.2, 60.0, 22.0, 23.0, 15.0),
(1, '2025-05-03 00:00:00', 44.5, 49.9, 16.5, -0.1, 70.0, 18.0, 28.0, 24.0),
(1, '2025-05-04 00:00:00', 47.0, 51.5, 15.9, 0.0, 62.0, 21.0, 24.0, 17.0),
(1, '2025-05-05 00:00:00', 46.2, 50.3, 16.0, 0.3, 66.0, 19.0, 26.0, 21.0);

-- 16. fitbit_average
INSERT INTO fitbit_average (user_id, recorded_at, period_type, avg_steps, avg_calories_total, avg_distance_km, avg_floors,
avg_heart_rate, avg_resting_heart_rate, avg_activity_duration, avg_sedentary_minutes, avg_lightly_active_minutes,
avg_fairly_active_minutes, avg_very_active_minutes, avg_total_sleep_hours, avg_deep_sleep_hours, avg_light_sleep_hours,
avg_rem_sleep_hours, avg_awake_hours, avg_sleep_heart_rate, avg_sleep_breathing_rate, avg_sleep_spo2, avg_spo2, avg_hrv,
avg_rhr, avg_respiratory_rate, avg_skin_temperature, avg_stress_score, avg_readiness_score, avg_sleep_score)
VALUES (1, '2025-04-01', '1D', 5000, 150.5, 3.5, 5, 70.2, 60, 30.5, 600, 120, 60, 30, 7, 2.5, 3.5, 0.5, 0.5, 65, 16.2, 98.5, 98.5, 50.2, 60, 16.2, 36.5, 40, 85, 80);

-- 17. fitbit_sleep_data
INSERT INTO fitbit_sleep_data (
    user_id, date, startTime, endTime, total_sleep_minutes,
    deep_sleep_hours, light_sleep_hours, rem_sleep_hours, minutesAwake,
    awakeningsCount, awakeCount, awakeDuration, restlessCount, restlessDuration,
    logId, timeinBed, minutesAsleep, efficiency, duration, quality,
    isMainSleep
)
VALUES
(1, '2025-05-01', '2025-04-30 23:50:00', '2025-05-01 06:30:00', 395, 1.2, 3.6, 0.9, 25, 3, 2, 10, 3, 12, 100001, 420, 395, 94.0, 420000.0, 88.0, TRUE),
(1, '2025-05-01', '2025-05-01 09:15:00', '2025-05-01 10:00:00', 40, 0.2, 0.6, 0.2, 5, 1, 1, 5, 1, 5, 100002, 45, 40, 89.0, 45000.0, 75.0, FALSE),
(1, '2025-05-01', '2025-05-01 13:00:00', '2025-05-01 13:45:00', 35, 0.1, 0.5, 0.1, 8, 1, 1, 8, 1, 6, 100003, 43, 35, 81.4, 43000.0, 70.0, FALSE),
(1, '2025-05-01', '2025-05-01 18:30:00', '2025-05-01 19:10:00', 30, 0.1, 0.4, 0.1, 6, 1, 1, 6, 1, 4, 100004, 36, 30, 83.3, 36000.0, 72.0, FALSE),
(1, '2025-05-01', '2025-05-01 23:50:00', '2025-05-02 06:20:00', 390, 1.1, 3.6, 0.9, 28, 3, 2, 10, 3, 12, 100005, 418, 390, 93.3, 418000.0, 88.0, TRUE),
(1, '2025-05-02', '2025-05-01 23:50:00', '2025-05-02 06:30:00', 395, 1.2, 3.6, 0.9, 25, 3, 2, 10, 3, 12, 100006, 420, 395, 94.0, 420000.0, 88.0, TRUE),
(1, '2025-05-02', '2025-05-02 09:15:00', '2025-05-02 10:00:00', 40, 0.2, 0.6, 0.2, 5, 1, 1, 5, 1, 5, 100007, 45, 40, 89.0, 45000.0, 75.0, FALSE),
(1, '2025-05-02', '2025-05-02 13:00:00', '2025-05-02 13:45:00', 35, 0.1, 0.5, 0.1, 8, 1, 1, 8, 1, 6, 100008, 43, 35, 81.4, 43000.0, 70.0, FALSE),
(1, '2025-05-02', '2025-05-02 18:30:00', '2025-05-02 19:10:00', 30, 0.1, 0.4, 0.1, 6, 1, 1, 6, 1, 4, 100009, 36, 30, 83.3, 36000.0, 72.0, FALSE),
(1, '2025-05-02', '2025-05-02 23:50:00', '2025-05-03 06:20:00', 390, 1.1, 3.6, 0.9, 28, 3, 2, 10, 3, 12, 100010, 418, 390, 93.3, 418000.0, 88.0, TRUE),
(1, '2025-05-03', '2025-05-02 23:50:00', '2025-05-03 06:30:00', 395, 1.2, 3.6, 0.9, 25, 3, 2, 10, 3, 12, 100011, 420, 395, 94.0, 420000.0, 88.0, TRUE),
(1, '2025-05-03', '2025-05-03 09:15:00', '2025-05-03 10:00:00', 40, 0.2, 0.6, 0.2, 5, 1, 1, 5, 1, 5, 100012, 45, 40, 89.0, 45000.0, 75.0, FALSE),
(1, '2025-05-03', '2025-05-03 13:00:00', '2025-05-03 13:45:00', 35, 0.1, 0.5, 0.1, 8, 1, 1, 8, 1, 6, 100013, 43, 35, 81.4, 43000.0, 70.0, FALSE),
(1, '2025-05-03', '2025-05-03 18:30:00', '2025-05-03 19:10:00', 30, 0.1, 0.4, 0.1, 6, 1, 1, 6, 1, 4, 100014, 36, 30, 83.3, 36000.0, 72.0, FALSE),
(1, '2025-05-03', '2025-05-03 23:50:00', '2025-05-04 06:20:00', 390, 1.1, 3.6, 0.9, 28, 3, 2, 10, 3, 12, 100015, 418, 390, 93.3, 418000.0, 88.0, TRUE),
(1, '2025-05-04', '2025-05-03 23:50:00', '2025-05-04 06:30:00', 395, 1.2, 3.6, 0.9, 25, 3, 2, 10, 3, 12, 100016, 420, 395, 94.0, 420000.0, 88.0, TRUE),
(1, '2025-05-04', '2025-05-04 09:15:00', '2025-05-04 10:00:00', 40, 0.2, 0.6, 0.2, 5, 1, 1, 5, 1, 5, 100017, 45, 40, 89.0, 45000.0, 75.0, FALSE),
(1, '2025-05-04', '2025-05-04 13:00:00', '2025-05-04 13:45:00', 35, 0.1, 0.5, 0.1, 8, 1, 1, 8, 1, 6, 100018, 43, 35, 81.4, 43000.0, 70.0, FALSE),
(1, '2025-05-04', '2025-05-04 18:30:00', '2025-05-04 19:10:00', 30, 0.1, 0.4, 0.1, 6, 1, 1, 6, 1, 4, 100019, 36, 30, 83.3, 36000.0, 72.0, FALSE),
(1, '2025-05-04', '2025-05-04 23:50:00', '2025-05-05 06:20:00', 390, 1.1, 3.6, 0.9, 28, 3, 2, 10, 3, 12, 100020, 418, 390, 93.3, 418000.0, 88.0, TRUE),
(1, '2025-05-05', '2025-05-04 23:50:00', '2025-05-05 06:30:00', 395, 1.2, 3.6, 0.9, 25, 3, 2, 10, 3, 12, 100021, 420, 395, 94.0, 420000.0, 88.0, TRUE),
(1, '2025-05-05', '2025-05-05 09:15:00', '2025-05-05 10:00:00', 40, 0.2, 0.6, 0.2, 5, 1, 1, 5, 1, 5, 100022, 45, 40, 89.0, 45000.0, 75.0, FALSE),
(1, '2025-05-05', '2025-05-05 13:00:00', '2025-05-05 13:45:00', 35, 0.1, 0.5, 0.1, 8, 1, 1, 8, 1, 6, 100023, 43, 35, 81.4, 43000.0, 70.0, FALSE),
(1, '2025-05-05', '2025-05-05 18:30:00', '2025-05-05 19:10:00', 30, 0.1, 0.4, 0.1, 6, 1, 1, 6, 1, 4, 100024, 36, 30, 83.3, 36000.0, 72.0, FALSE),
(1, '2025-05-05', '2025-05-05 23:50:00', '2025-05-06 06:20:00', 390, 1.1, 3.6, 0.9, 28, 3, 2, 10, 3, 12, 100025, 418, 390, 93.3, 418000.0, 88.0, TRUE),
(1, '2025-05-06', '2025-05-05 23:50:00', '2025-05-06 06:30:00', 395, 1.2, 3.6, 0.9, 25, 3, 2, 10, 3, 12, 100026, 420, 395, 94.0, 420000.0, 88.0, TRUE),
(1, '2025-05-06', '2025-05-06 09:15:00', '2025-05-06 10:00:00', 40, 0.2, 0.6, 0.2, 5, 1, 1, 5, 1, 5, 100027, 45, 40, 89.0, 45000.0, 75.0, FALSE),
(1, '2025-05-06', '2025-05-06 13:00:00', '2025-05-06 13:45:00', 35, 0.1, 0.5, 0.1, 8, 1, 1, 8, 1, 6, 100028, 43, 35, 81.4, 43000.0, 70.0, FALSE),
(1, '2025-05-06', '2025-05-06 18:30:00', '2025-05-06 19:10:00', 30, 0.1, 0.4, 0.1, 6, 1, 1, 6, 1, 4, 100029, 36, 30, 83.3, 36000.0, 72.0, FALSE),
(1, '2025-05-06', '2025-05-06 23:50:00', '2025-05-07 06:20:00', 390, 1.1, 3.6, 0.9, 28, 3, 2, 10, 3, 12, 100030, 418, 390, 93.3, 418000.0, 88.0, TRUE),
(1, '2025-05-07', '2025-05-06 23:50:00', '2025-05-07 06:30:00', 395, 1.2, 3.6, 0.9, 25, 3, 2, 10, 3, 12, 100031, 420, 395, 94.0, 420000.0, 88.0, TRUE),
(1, '2025-05-07', '2025-05-07 09:15:00', '2025-05-07 10:00:00', 40, 0.2, 0.6, 0.2, 5, 1, 1, 5, 1, 5, 100032, 45, 40, 89.0, 45000.0, 75.0, FALSE),
(1, '2025-05-07', '2025-05-07 13:00:00', '2025-05-07 13:45:00', 35, 0.1, 0.5, 0.1, 8, 1, 1, 8, 1, 6, 100033, 43, 35, 81.4, 43000.0, 70.0, FALSE),
(1, '2025-05-07', '2025-05-07 18:30:00', '2025-05-07 19:10:00', 30, 0.1, 0.4, 0.1, 6, 1, 1, 6, 1, 4, 100034, 36, 30, 83.3, 36000.0, 72.0, FALSE),
(1, '2025-05-07', '2025-05-07 23:50:00', '2025-05-08 06:20:00', 390, 1.1, 3.6, 0.9, 28, 3, 2, 10, 3, 12, 100035, 418, 390, 93.3, 418000.0, 88.0, TRUE);

-- 18. comments
INSERT INTO comments (report_id, author_id, role, content)
VALUES 
(1, 3, 'doctor', '오늘은 전반적으로 양호한 수치입니다. 꾸준히 관리해주세요.'),
(1, 2, 'guardian', '어머니 식사는 잘 하셨지요? 바람이 선선하니 산책이라도 다녀오세요~');

-- 19. s3_bucket
INSERT INTO s3_bucket (file_key, bucket_name, url, storage_class, file_type, category, related_report_id)
VALUES ('basic_pdf_20250401.pdf', 'elderly-bucket', 'https://bucket.s3/file/basic_pdf_20250401.pdf', 'STANDARD', 'pdf', 'basic_report', 1);

-- 20. fitbit_average_history
INSERT INTO fitbit_average_history (
    user_id, recorded_at, period_type,
    avg_steps, avg_calories_total, avg_distance_km, avg_floors,
    avg_heart_rate, avg_resting_heart_rate, avg_activity_duration,
    avg_sedentary_minutes, avg_lightly_active_minutes, avg_fairly_active_minutes, avg_very_active_minutes,
    avg_total_sleep_hours, avg_deep_sleep_hours, avg_light_sleep_hours, avg_rem_sleep_hours, avg_awake_hours,
    avg_sleep_heart_rate, avg_sleep_breathing_rate, avg_sleep_spo2, avg_spo2,
    avg_hrv, avg_rhr, avg_respiratory_rate, avg_skin_temperature,
    avg_stress_score, avg_readiness_score, avg_sleep_score
)
VALUES
(1, '2025-05-01', '30D', 8500, 2200.5, 6.2, 10, 72.3, 60, 45.0, 600, 100, 50, 30, 7, 1.5, 3.2, 1.8, 0.5, 65.0, 15.2, 96.5, 97.1, 45.3, 58.0, 16.8, 33.2, 23.0, 75.0, 82.5),
(2, '2025-05-01', '90D', 9100, 2350.0, 7.1, 12, 74.0, 62, 50.5, 580, 120, 55, 28, 6, 1.2, 3.0, 1.5, 0.3, 63.2, 14.8, 95.0, 96.0, 50.1, 60.0, 17.0, 34.5, 25.5, 78.0, 80.0),
(3, '2025-05-01', '180D', 7700, 2100.0, 5.8, 8, 70.1, 59, 40.0, 620, 90, 40, 20, 8, 2.0, 3.5, 2.2, 0.7, 67.0, 16.0, 97.0, 97.8, 42.0, 57.0, 16.5, 32.0, 20.0, 72.0, 85.2);

-- 21. device_tokens
INSERT INTO device_tokens (user_id, fcm_token, platform)
VALUES (1, 'sample_fcm_token_123456', 'android');

