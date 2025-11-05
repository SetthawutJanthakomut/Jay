<version 1 18/10/2025 10:12>
<html>
<head>
  <base target="_top">
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>QC RFI System</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@300;400;500;600&display=swap" rel="stylesheet">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    
    body {
      font-family: 'Kanit', sans-serif;
      min-height: 100vh;
      background: linear-gradient(135deg, #667eea 0%, #4c63d2 25%, #3b5bdb 50%, #2948b1 75%, #1877f2 100%);
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 20px;
    }
    
    .container {
      width: 100%;
      max-width: 700px;
      background: #ffffff;
      border-radius: 20px;
      padding: 40px 35px;
      box-shadow: 0 20px 60px rgba(24, 119, 242, 0.3);
      animation: fadeIn 0.5s ease-out;
    }
    
    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
    
    h1 {
      text-align: center;
      font-size: 32px;
      font-weight: 600;
      background: linear-gradient(135deg, #1877f2 0%, #2948b1 50%, #3b5bdb 100%);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      margin-bottom: 10px;
    }
    
    .subtitle {
      text-align: center;
      font-size: 16px;
      font-weight: 300;
      color: #666;
      margin-bottom: 30px;
    }

    .info-box {
      background: linear-gradient(135deg, #e7f3ff 0%, #d4e9ff 100%);
      border-left: 4px solid #1877f2;
      padding: 15px;
      border-radius: 10px;
      margin-bottom: 25px;
      font-size: 14px;
      color: #1c4587;
    }

    .info-box strong {
      color: #1877f2;
    }
    
    .form-group {
      margin-bottom: 20px;
    }
    
    label {
      display: block;
      font-size: 14px;
      font-weight: 500;
      color: #333;
      margin-bottom: 8px;
    }
    
    label span.required {
      color: #e74c3c;
    }
    
    input, select, textarea {
      width: 100%;
      padding: 12px 16px;
      border: 2px solid #e4e6eb;
      background: #ffffff;
      border-radius: 10px;
      font-family: 'Kanit', sans-serif;
      font-size: 15px;
      transition: all 0.3s ease;
      color: #333;
    }
    
    textarea {
      height: 90px;
      resize: vertical;
    }
    
    input:focus, select:focus, textarea:focus {
      outline: none;
      background: white;
      border-color: #1877f2;
      box-shadow: 0 0 0 3px rgba(24, 119, 242, 0.1);
    }
    
    input::placeholder, textarea::placeholder {
      color: #999;
      font-weight: 300;
    }
    
    input:disabled, select:disabled, textarea:disabled {
      opacity: 0.6;
      cursor: not-allowed;
      background: #f5f6f7;
    }
    
    .loading-select {
      background-color: #f5f6f7 !important;
      color: #666 !important;
    }
    
    .form-row {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 15px;
    }
    
    .inspector-container {
      border: 2px solid #e4e6eb;
      border-radius: 10px;
      padding: 15px;
      background: #f8f9fa;
      min-height: 100px;
      max-height: 300px;
      overflow-y: auto;
    }
    
    .inspector-loading {
      color: #999;
      text-align: center;
      padding: 30px;
      font-style: italic;
    }
    
    .inspector-checkbox-group {
      display: flex;
      flex-direction: column;
      gap: 10px;
    }
    
    .inspector-checkbox-item {
      display: flex;
      align-items: center;
      gap: 12px;
      padding: 12px;
      border-radius: 8px;
      background: white;
      border: 2px solid #e4e6eb;
      cursor: pointer;
      transition: all 0.2s;
    }
    
    .inspector-checkbox-item:hover {
      border-color: #1877f2;
      background: #f0f7ff;
    }
    
    .inspector-checkbox-item input[type="checkbox"] {
      width: 20px;
      height: 20px;
      cursor: pointer;
      accent-color: #1877f2;
    }
    
    .inspector-checkbox-item label {
      cursor: pointer;
      margin: 0;
      font-size: 15px;
      color: #333;
      flex: 1;
    }
    
    .inspector-checkbox-item .badge {
      font-size: 12px;
      padding: 4px 8px;
      border-radius: 5px;
      background: #e7f3ff;
      color: #1877f2;
      font-weight: 500;
    }
    
    .inspector-checkbox-item input[type="checkbox"]:checked + label {
      font-weight: 600;
      color: #1877f2;
    }
    
    button {
      width: 100%;
      padding: 14px;
      background: linear-gradient(135deg, #1877f2 0%, #2948b1 50%, #3b5bdb 100%);
      color: white;
      border: none;
      border-radius: 10px;
      font-family: 'Kanit', sans-serif;
      font-size: 16px;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.3s ease;
      margin-top: 10px;
      box-shadow: 0 4px 15px rgba(24, 119, 242, 0.3);
    }
    
    button:hover:not(:disabled) {
      transform: translateY(-2px);
      box-shadow: 0 6px 25px rgba(24, 119, 242, 0.4);
    }
    
    button:active:not(:disabled) {
      transform: translateY(0);
    }
    
    button:disabled {
      opacity: 0.6;
      cursor: not-allowed;
      transform: none;
    }
    
    .loading {
      display: none;
      text-align: center;
      margin-top: 20px;
    }
    
    .spinner {
      width: 40px;
      height: 40px;
      margin: 0 auto 10px;
      border: 3px solid rgba(24, 119, 242, 0.2);
      border-top-color: #1877f2;
      border-radius: 50%;
      animation: spin 0.8s linear infinite;
    }
    
    @keyframes spin {
      to { transform: rotate(360deg); }
    }
    
    .loading p {
      color: #666;
      font-weight: 300;
    }
    
    .message {
      padding: 12px 16px;
      margin-top: 20px;
      border-radius: 10px;
      text-align: center;
      display: none;
      font-size: 14px;
      animation: slideIn 0.3s ease-out;
      white-space: pre-line;
    }
    
    @keyframes slideIn {
      from {
        opacity: 0;
        transform: translateY(-10px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
    
    .success {
      background: #d4edda;
      color: #155724;
      border: 1px solid #c3e6cb;
    }
    
    .error {
      background: #f8d7da;
      color: #721c24;
      border: 1px solid #f5c6cb;
    }
    
    .info {
      background: #d1ecf1;
      color: #0c5460;
      border: 1px solid #bee5eb;
    }
    
    .warning {
      background: #fff3cd;
      color: #856404;
      border: 1px solid #ffeaa7;
    }
    
    .time-info {
      font-size: 12px;
      color: #1877f2;
      margin-top: 5px;
      font-style: italic;
    }
    
    .footer-info {
      text-align: center;
      margin-top: 20px;
      padding-top: 20px;
      border-top: 1px solid #e4e6eb;
    }
    
    .footer-info p {
      color: #666;
      font-size: 14px;
      margin: 5px 0;
    }
    
    .footer-info .version {
      color: #999;
      font-size: 12px;
    }
    
    @media (max-width: 480px) {
      .container {
        padding: 30px 20px;
      }
      
      h1 {
        font-size: 26px;
      }
      
      .form-row {
        grid-template-columns: 1fr;
      }
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="header-section" style="text-align: center; margin-bottom: 30px;">
  <!-- Icon Container -->
  <div style="display: inline-flex; align-items: center; justify-content: center; width: 65px; height: 65px; background: linear-gradient(135deg, #1877f2 0%, #2948b1 100%); border-radius: 16px; margin-bottom: 12px; box-shadow: 0 6px 20px rgba(24, 119, 242, 0.3);">
    <span style="font-size: 36px;">📋</span>
  </div>
  
  <!-- Title with Icon Decoration -->
  <h1>
    <span style="display: inline-flex; align-items: center; gap: 10px;">
      RFI Requirement System
      <span style="font-size: 20px; color: #10b981;">✓</span>
    </span>
  </h1>
  <p class="subtitle">ระบบบันทึก Request for Information (สำหรับ QC)</p>
</div>
    
    <div class="info-box">
      <strong>📌 ข้อกำหนด:</strong> สามารถจองได้ทุกวัน (ไม่จำกัดเวลา)<br>
      <strong>⏰ เวลาทำการ:</strong> 09:00 - 20:00 น. (ช่วงละ 30 นาที)<br>
      <strong>🛡️ Buffer:</strong> ระบบจะสำรอง ±25 นาที ระหว่าง RFI<br>
      <strong>👥 จัดทีม:</strong> เลือกทีมที่ต้องการ (เฉพาะทีมที่ว่าง)
    </div>
    
    <form id="qcRfiForm">
      <div class="form-group">
        <label for="code">รหัสโครงการ (Code) <span class="required">*</span></label>
        <select id="code" name="code" required>
          <option value="">-- กำลังโหลด... --</option>
        </select>
        <div class="time-info">เลือกรหัสโครงการ</div>
      </div>

      <div class="form-group">
        <label for="description">รายละเอียด RFI <span class="required">*</span></label>
        <textarea id="description" name="description" required placeholder="อธิบายรายละเอียด Request for Information"></textarea>
      </div>
      
      <div class="form-group">
        <label for="location">สถานที่ <span class="required">*</span></label>
        <input type="text" id="location" name="location" required placeholder="เช่น Station 1, Building A">
      </div>
      
      <div class="form-group">
        <label for="requestDate">วันที่ตรวจงาน <span class="required">*</span></label>
        <input type="date" id="requestDate" name="requestDate" required>
        <div class="time-info">สามารถเลือกวันที่ย้อนหลังได้</div>
      </div>
      
      <div class="form-row">
        <div class="form-group">
          <label for="startTime">เวลาเริ่มต้น <span class="required">*</span></label>
          <select id="startTime" name="startTime" required disabled>
            <option value="">-- กรุณาเลือกวันที่ก่อน --</option>
          </select>
        </div>
        
        <div class="form-group">
          <label for="endTime">เวลาสิ้นสุด</label>
          <select id="endTime" name="endTime">
            <option value="">-- กรุณาเลือกเวลาเริ่มก่อน --</option>
          </select>
          <div class="time-info">ไม่ระบุ = ใช้เวลาเริ่มต้น +1 ชั่วโมง</div>
        </div>
      </div>

      <div class="form-group">
        <label>ทีมงาน (Assigned Inspector) <span class="required">*</span></label>
        <div id="assignedInspectorContainer" class="inspector-container">
          <div class="inspector-loading">กรุณาเลือกวันที่และเวลาก่อน</div>
        </div>
        <input type="hidden" id="assignedInspector" name="assignedInspector" required>
        <div class="time-info" id="selectedTeamsInfo">เลือกได้หลายทีม (เฉพาะทีมที่ว่าง)</div>
      </div>

      <div class="form-group">
        <label for="requester">ผู้ขอ (Requester) <span class="required">*</span></label>
        <select id="requester" name="requester" required>
          <option value="">-- กำลังโหลด... --</option>
        </select>
        <div class="time-info">เลือกผู้ขอ RFI</div>
      </div>

<div class="form-row">
        <div class="form-group" id="surveyReportGroup" style="display:none;">
          <input type="hidden" id="requireSurveyReport" name="requireSurveyReport" value="None">
          <div style="padding: 12px; background: #e7f3ff; border: 2px solid #1877f2; border-radius: 10px;">
            <label style="margin-bottom: 5px;">Survey Report</label>
            <div style="color: #1877f2; font-weight: 600; font-size: 15px;">✓ Both (Open + Close)</div>
            <div class="time-info" style="color: #1877f2;">กำหนดอัตโนมัติเมื่อเลือก Survey Team</div>
          </div>
        </div>
        
        <div class="form-group" id="labReportGroup" style="display:none;">
          <label for="requireLabReport">Lab Report <span class="required">*</span></label>
          <select id="requireLabReport" name="requireLabReport">
            <option value="Both">Both (Open + Close)</option>
            <option value="Closing">Closing (Close เท่านั้น)</option>
          </select>
          <div class="time-info">แสดงเมื่อเลือก Lab Team</div>
        </div>
      </div>
      
      <button type="submit" id="submitBtn">สร้าง RFI</button>
    </form>
    
    <div class="loading" id="loading">
      <div class="spinner"></div>
      <p>กำลังบันทึกข้อมูล...</p>
    </div>
    
    <div id="message" class="message"></div>
    
    <div class="footer-info">
      <p>QC RFI System</p>
      <p class="version">สำหรับ Quality Control Team</p>
    </div>
  </div>
  
  <script>
    var currentUserEmail = '';
    var availableTeams = [];

    window.onload = function() {
      loadCodeList();
      loadRequesterList();
      getCurrentUserEmail();
      checkQCRole();
    };

    function checkQCRole() {
      google.script.run
        .withSuccessHandler(function(result) {
          if (!result.success) {
            showMessage(result.message, 'error', 10000);
            document.getElementById('submitBtn').disabled = true;
            document.getElementById('qcRfiForm').style.opacity = '0.5';
            document.getElementById('qcRfiForm').style.pointerEvents = 'none';
          } else {
            showMessage('ยินดีต้อนรับ ' + result.name + ' (' + result.role + ')', 'success', 3000);
          }
        })
        .withFailureHandler(function(error) {
          showMessage('ไม่สามารถตรวจสอบสิทธิ์ได้', 'error');
        })
        .validateQCRole();
    }

    function getCurrentUserEmail() {
      google.script.run
        .withSuccessHandler(function(email) {
          currentUserEmail = email;
        })
        .withFailureHandler(function(error) {
          console.error('Error getting user email:', error);
        })
        .getCurrentUserEmail();
    }

    function loadCodeList() {
      var codeSelect = document.getElementById('code');
      codeSelect.innerHTML = '<option value="">-- กำลังโหลดรหัสโครงการ... --</option>';
      codeSelect.disabled = true;
      
      google.script.run
        .withSuccessHandler(function(codes) {
          codeSelect.innerHTML = '';
          
          if (!codes || codes.length === 0) {
            codeSelect.innerHTML = '<option value="">-- ไม่พบรหัสโครงการ --</option>';
            showMessage('ไม่พบข้อมูลรหัสโครงการ', 'warning');
          } else {
            codeSelect.innerHTML = '<option value="">-- เลือกรหัสโครงการ --</option>';
            
            for (var i = 0; i < codes.length; i++) {
              var option = document.createElement('option');
              option.value = codes[i].code;
              option.textContent = codes[i].code + ' - ' + codes[i].name;
              codeSelect.appendChild(option);
            }
            
            codeSelect.disabled = false;
          }
        })
        .withFailureHandler(function(error) {
          codeSelect.innerHTML = '<option value="">-- เกิดข้อผิดพลาด --</option>';
          showMessage('เกิดข้อผิดพลาดในการโหลดรหัสโครงการ', 'error');
        })
        .getCodeList();
    }

    function loadRequesterList() {
      var requesterSelect = document.getElementById('requester');
      requesterSelect.innerHTML = '<option value="">-- กำลังโหลดผู้ขอ... --</option>';
      requesterSelect.disabled = true;
      
      google.script.run
        .withSuccessHandler(function(requesters) {
          requesterSelect.innerHTML = '';
          
          if (!requesters || requesters.length === 0) {
            requesterSelect.innerHTML = '<option value="">-- ไม่พบผู้ขอ --</option>';
            showMessage('ไม่พบข้อมูลผู้ขอ', 'warning');
          } else {
            requesterSelect.innerHTML = '<option value="">-- เลือกผู้ขอ --</option>';
            
            for (var i = 0; i < requesters.length; i++) {
              var option = document.createElement('option');
              option.value = requesters[i].email;
              option.textContent = requesters[i].name + ' (' + requesters[i].email + ')';
              option.setAttribute('data-name', requesters[i].name);
              requesterSelect.appendChild(option);
            }
            
            requesterSelect.disabled = false;
          }
        })
        .withFailureHandler(function(error) {
          requesterSelect.innerHTML = '<option value="">-- เกิดข้อผิดพลาด --</option>';
          showMessage('เกิดข้อผิดพลาดในการโหลดผู้ขอ', 'error');
        })
        .getRequesterList();
    }

    function loadAvailableTeams() {
      var date = document.getElementById('requestDate').value;
      var startTime = document.getElementById('startTime').value;
      var endTime = document.getElementById('endTime').value || calculateDefaultEndTime(startTime);
      var container = document.getElementById('assignedInspectorContainer');
      
      if (!date || !startTime) {
        container.innerHTML = '<div class="inspector-loading">กรุณาเลือกวันที่และเวลาเริ่มต้นก่อน</div>';
        return;
      }
      
      container.innerHTML = '<div class="inspector-loading">กำลังโหลดทีมงานที่ว่าง...</div>';
      
      google.script.run
        .withSuccessHandler(function(resources) {
          availableTeams = resources || [];
          
          if (availableTeams.length === 0) {
            container.innerHTML = '<div class="inspector-loading">ไม่มีทีมว่างในช่วงเวลานี้</div>';
            showMessage('ไม่มีทีมว่างสำหรับวันและเวลาที่เลือก', 'warning');
            return;
          }
          
          var html = '<div class="inspector-checkbox-group">';
          
          for (var i = 0; i < availableTeams.length; i++) {
            var team = availableTeams[i];
            html += '<div class="inspector-checkbox-item">';
            html += '<input type="checkbox" id="team_' + team.id + '" value="' + team.name + '" onchange="updateSelectedTeams()">';
            html += '<label for="team_' + team.id + '">' + team.name + '</label>';
            html += '<span class="badge">' + team.subType + '</span>';
            html += '</div>';
          }
          
          html += '</div>';
          container.innerHTML = html;
          showMessage('พบทีมว่าง ' + availableTeams.length + ' ทีม', 'info', 3000);
        })
        .withFailureHandler(function(error) {
          container.innerHTML = '<div class="inspector-loading">เกิดข้อผิดพลาด</div>';
          showMessage('เกิดข้อผิดพลาดในการโหลดทีมงาน', 'error');
        })
        .getAvailableResourcesList(date, startTime, endTime);
    }

    function calculateDefaultEndTime(startTime) {
      if (!startTime) return '';
      var parts = startTime.split(':');
      var hour = parseInt(parts[0]) + 1;
      return hour.toString().padStart(2, '0') + ':' + parts[1];
    }

    function updateSelectedTeams() {
      var checkboxes = document.querySelectorAll('#assignedInspectorContainer input[type="checkbox"]:checked');
      var selectedTeams = [];
      var hasSurvey = false;
      var hasLab = false;
      
      for (var i = 0; i < checkboxes.length; i++) {
        selectedTeams.push(checkboxes[i].value);
        var teamName = checkboxes[i].value.toLowerCase();
        if (teamName.indexOf('survey') !== -1) hasSurvey = true;
        if (teamName.indexOf('lab') !== -1) hasLab = true;
      }
      
      document.getElementById('assignedInspector').value = selectedTeams.join(',');
      
      document.getElementById('surveyReportGroup').style.display = hasSurvey ? 'block' : 'none';
if (hasSurvey) {
  document.getElementById('requireSurveyReport').value = 'Both';
} else {
  document.getElementById('requireSurveyReport').value = 'None';
}
      
      document.getElementById('labReportGroup').style.display = hasLab ? 'block' : 'none';
      if (!hasLab) document.getElementById('requireLabReport').value = 'None';
      
      var infoDiv = document.getElementById('selectedTeamsInfo');
      if (selectedTeams.length > 0) {
        infoDiv.textContent = 'เลือกแล้ว: ' + selectedTeams.join(', ');
        infoDiv.style.fontWeight = '600';
      } else {
        infoDiv.textContent = 'เลือกได้หลายทีม (เฉพาะทีมที่ว่าง)';
        infoDiv.style.fontWeight = '400';
      }
    }

    function showMessage(text, type, duration) {
      if (typeof duration === 'undefined') duration = 5000;
      var messageDiv = document.getElementById('message');
      messageDiv.textContent = text;
      messageDiv.className = 'message ' + type;
      messageDiv.style.display = 'block';
      setTimeout(function() {
        messageDiv.style.display = 'none';
      }, duration);
    }

    document.getElementById('requestDate').addEventListener('change', function() {
      updateAvailableSlots();
      document.getElementById('assignedInspectorContainer').innerHTML = '<div class="inspector-loading">กรุณาเลือกเวลาก่อน</div>';
      document.getElementById('assignedInspector').value = '';
    });

    document.getElementById('startTime').addEventListener('change', function() {
      updateEndTimeSlots();
      loadAvailableTeams();
    });

    document.getElementById('endTime').addEventListener('change', function() {
      loadAvailableTeams();
    });

    document.getElementById('qcRfiForm').addEventListener('submit', handleSubmit);

    function updateAvailableSlots() {
      var date = document.getElementById('requestDate').value;
      var startTimeSelect = document.getElementById('startTime');
      
      startTimeSelect.innerHTML = '<option value="">-- กำลังโหลด... --</option>';
      startTimeSelect.disabled = true;
      resetEndTimeSelect();
      
      if (date) {
        google.script.run
          .withSuccessHandler(function(slots) {
            startTimeSelect.innerHTML = '';
            if (!slots || slots.length === 0) {
              startTimeSelect.innerHTML = '<option value="">-- ไม่มีเวลาว่าง --</option>';
            } else {
              startTimeSelect.innerHTML = '<option value="">-- เลือกเวลาเริ่มต้น --</option>';
              for (var i = 0; i < slots.length; i++) {
                var option = document.createElement('option');
                option.value = slots[i];
                option.textContent = slots[i] + ' น.';
                startTimeSelect.appendChild(option);
              }
              startTimeSelect.disabled = false;
            }
          })
          .withFailureHandler(function(error) {
            startTimeSelect.innerHTML = '<option value="">-- เกิดข้อผิดพลาด --</option>';
          })
          .getAvailableTimeSlots(date, null);
      }
    }

    function updateEndTimeSlots() {
      var date = document.getElementById('requestDate').value;
      var startTime = document.getElementById('startTime').value;
      var endTimeSelect = document.getElementById('endTime');
      
      if (!startTime) {
        resetEndTimeSelect();
        return;
      }
      
      endTimeSelect.innerHTML = '<option value="">-- กำลังโหลด... --</option>';
      endTimeSelect.disabled = true;
      
      google.script.run
        .withSuccessHandler(function(times) {
          endTimeSelect.innerHTML = '<option value="">-- ไม่ระบุ (default +1 ชม.) --</option>';
          if (times && times.length > 0) {
            for (var i = 0; i < times.length; i++) {
              var option = document.createElement('option');
              option.value = times[i];
              option.textContent = times[i] + ' น.';
              endTimeSelect.appendChild(option);
            }
            endTimeSelect.disabled = false;
          }
        })
        .withFailureHandler(function(error) {
          endTimeSelect.innerHTML = '<option value="">-- เกิดข้อผิดพลาด --</option>';
        })
        .getAvailableEndTimes(date, startTime, null);
    }

    function resetEndTimeSelect() {
      var endTimeSelect = document.getElementById('endTime');
      endTimeSelect.innerHTML = '<option value="">-- กรุณาเลือกเวลาเริ่มก่อน --</option>';
      endTimeSelect.disabled = true;
    }

    function handleSubmit(event) {
      event.preventDefault();
      
      var submitBtn = document.getElementById('submitBtn');
      var loading = document.getElementById('loading');
      var requesterSelect = document.getElementById('requester');
      var selectedOption = requesterSelect.options[requesterSelect.selectedIndex];
      
      var formData = {
        code: document.getElementById('code').value,
        description: document.getElementById('description').value.trim(),
        location: document.getElementById('location').value.trim(),
        requestDate: document.getElementById('requestDate').value,
        startTime: document.getElementById('startTime').value,
        endTime: document.getElementById('endTime').value,
        assignedInspector: document.getElementById('assignedInspector').value,
        requesterEmail: requesterSelect.value,
        requesterName: selectedOption.getAttribute('data-name'),
        requireSurveyReport: document.getElementById('requireSurveyReport').value || 'None',
        requireLabReport: document.getElementById('requireLabReport').value || 'None',
        recordedBy: currentUserEmail
      };
      
      var requiredFields = ['code', 'description', 'location', 'requestDate', 'startTime', 'assignedInspector', 'requesterEmail'];
      var missing = false;
      for (var i = 0; i < requiredFields.length; i++) {
        if (!formData[requiredFields[i]]) {
          missing = true;
          break;
        }
      }
      
      if (missing) {
        showMessage('กรุณากรอกข้อมูลให้ครบถ้วน', 'error');
        return;
      }
      
      submitBtn.disabled = true;
      loading.style.display = 'block';
      
      google.script.run
        .withSuccessHandler(function(result) {
          loading.style.display = 'none';
          submitBtn.disabled = false;
          
          if (result && result.success) {
            showMessage(result.message || 'สร้าง RFI เรียบร้อยแล้ว', 'success', 8000);
            resetForm();
          } else {
            showMessage(result.message || 'เกิดข้อผิดพลาด', 'error');
          }
        })
        .withFailureHandler(function(error) {
          loading.style.display = 'none';
          submitBtn.disabled = false;
          showMessage('เกิดข้อผิดพลาดในการบันทึก', 'error');
        })
        .saveQCRFI(formData);
    }

    function resetForm() {
      document.getElementById('qcRfiForm').reset();
      document.getElementById('startTime').innerHTML = '<option value="">-- กรุณาเลือกวันที่ก่อน --</option>';
      document.getElementById('startTime').disabled = true;
      resetEndTimeSelect();
      document.getElementById('assignedInspectorContainer').innerHTML = '<div class="inspector-loading">กรุณาเลือกวันที่และเวลาก่อน</div>';
      document.getElementById('assignedInspector').value = '';
      document.getElementById('surveyReportGroup').style.display = 'none';
      document.getElementById('labReportGroup').style.display = 'none';
      loadCodeList();
      loadRequesterList();
    }
  </script>
</body>
</html>
