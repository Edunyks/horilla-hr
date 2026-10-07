BEGIN;
SET CONSTRAINTS ALL DEFERRED;

-- base.WorkTypeRequestComment
DELETE FROM "base_worktyperequestcomment_files" WHERE "worktyperequestcomment_id" IN (SELECT "id" FROM "base_worktyperequestcomment" WHERE TRUE);
DELETE FROM "base_worktyperequestcomment" WHERE TRUE;

-- base.WorkTypeRequest
DELETE FROM "base_worktyperequestcomment_files" WHERE "worktyperequestcomment_id" IN (SELECT "id" FROM "base_worktyperequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "base_worktyperequest" WHERE TRUE));
DELETE FROM "base_worktyperequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "base_worktyperequest" WHERE TRUE);
DELETE FROM "base_worktyperequest" WHERE TRUE;

-- base.ShiftRequestComment
DELETE FROM "base_shiftrequestcomment_files" WHERE "shiftrequestcomment_id" IN (SELECT "id" FROM "base_shiftrequestcomment" WHERE TRUE);
DELETE FROM "base_shiftrequestcomment" WHERE TRUE;

-- base.ShiftRequest
DELETE FROM "base_shiftrequestcomment_files" WHERE "shiftrequestcomment_id" IN (SELECT "id" FROM "base_shiftrequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "base_shiftrequest" WHERE TRUE));
DELETE FROM "base_shiftrequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "base_shiftrequest" WHERE TRUE);
DELETE FROM "base_shiftrequest" WHERE TRUE;

-- base.BaserequestFile
DELETE FROM "base_worktyperequestcomment_files" WHERE "baserequestfile_id" IN (SELECT "id" FROM "base_baserequestfile" WHERE TRUE);
DELETE FROM "base_shiftrequestcomment_files" WHERE "baserequestfile_id" IN (SELECT "id" FROM "base_baserequestfile" WHERE TRUE);
DELETE FROM "base_baserequestfile" WHERE TRUE;

-- base.RotatingWorkTypeAssign
DELETE FROM "base_rotatingworktypeassign" WHERE TRUE;

-- base.RotatingShiftAssign
DELETE FROM "base_rotatingshiftassign" WHERE TRUE;

-- base.RosterPublishLog
DELETE FROM "base_rosterpublishlog" WHERE TRUE;

-- base.Roster
DELETE FROM "base_roster" WHERE TRUE;

-- base.AnnouncementComment
DELETE FROM "base_announcementcomment" WHERE TRUE;

-- base.AnnouncementView
DELETE FROM "base_announcementview" WHERE TRUE;

-- base.Announcement
DELETE FROM "base_announcement_attachments" WHERE "announcement_id" IN (SELECT "id" FROM "base_announcement" WHERE TRUE);
DELETE FROM "base_announcement_employees" WHERE "announcement_id" IN (SELECT "id" FROM "base_announcement" WHERE TRUE);
DELETE FROM "base_announcement_department" WHERE "announcement_id" IN (SELECT "id" FROM "base_announcement" WHERE TRUE);
DELETE FROM "base_announcement_job_position" WHERE "announcement_id" IN (SELECT "id" FROM "base_announcement" WHERE TRUE);
DELETE FROM "base_announcement_company_id" WHERE "announcement_id" IN (SELECT "id" FROM "base_announcement" WHERE TRUE);
DELETE FROM "base_announcement_filtered_employees" WHERE "announcement_id" IN (SELECT "id" FROM "base_announcement" WHERE TRUE);
DELETE FROM "base_announcementcomment" WHERE "announcement_id_id" IN (SELECT "id" FROM "base_announcement" WHERE TRUE);
DELETE FROM "base_announcementview" WHERE "announcement_id" IN (SELECT "id" FROM "base_announcement" WHERE TRUE);
DELETE FROM "base_announcement" WHERE TRUE;

-- base.Attachment
DELETE FROM "base_announcement_attachments" WHERE "attachment_id" IN (SELECT "id" FROM "base_attachment" WHERE TRUE);
DELETE FROM "base_attachment" WHERE TRUE;

-- base.EmailLog
DELETE FROM "base_emaillog" WHERE TRUE;

-- base.PenaltyAccounts
DELETE FROM "base_penaltyaccounts" WHERE TRUE;

-- base.DriverViewed
DELETE FROM "base_driverviewed" WHERE TRUE;

-- employee.EmployeeNote
DELETE FROM "employee_employeenote_note_files" WHERE "employeenote_id" IN (SELECT "id" FROM "employee_employeenote" WHERE TRUE);
DELETE FROM "employee_employeenote" WHERE TRUE;

-- employee.NoteFiles
DELETE FROM "employee_employeenote_note_files" WHERE "notefiles_id" IN (SELECT "id" FROM "employee_notefiles" WHERE TRUE);
DELETE FROM "employee_notefiles" WHERE TRUE;

-- employee.DisciplinaryAction
DELETE FROM "employee_disciplinaryaction_employee_id" WHERE "disciplinaryaction_id" IN (SELECT "id" FROM "employee_disciplinaryaction" WHERE TRUE);
DELETE FROM "employee_disciplinaryaction" WHERE TRUE;

-- employee.BonusPoint
DELETE FROM "pms_employeebonuspoint" WHERE "bonus_point_id_id" IN (SELECT "id" FROM "employee_bonuspoint" WHERE TRUE);
DELETE FROM "employee_bonuspoint" WHERE TRUE;

-- horilla_documents.Document
DELETE FROM "horilla_documents_document" WHERE TRUE;

-- horilla_documents.DocumentRequest
DELETE FROM "horilla_documents_documentrequest_employee_id" WHERE "documentrequest_id" IN (SELECT "id" FROM "horilla_documents_documentrequest" WHERE TRUE);
DELETE FROM "horilla_documents_documentrequest" WHERE TRUE;

-- attendance.AttendanceRequestComment
DELETE FROM "attendance_attendancerequestcomment_files" WHERE "attendancerequestcomment_id" IN (SELECT "id" FROM "attendance_attendancerequestcomment" WHERE TRUE);
DELETE FROM "attendance_attendancerequestcomment" WHERE TRUE;

-- attendance.AttendanceRequestFile
DELETE FROM "attendance_attendancerequestcomment_files" WHERE "attendancerequestfile_id" IN (SELECT "id" FROM "attendance_attendancerequestfile" WHERE TRUE);
DELETE FROM "attendance_attendancerequestfile" WHERE TRUE;

-- attendance.AttendanceConflictResolution
DELETE FROM "attendance_attendanceconflictresolution" WHERE TRUE;

-- attendance.AttendanceLateComeEarlyOut
DELETE FROM "base_penaltyaccounts" WHERE "late_early_id_id" IN (SELECT "id" FROM "attendance_attendancelatecomeearlyout" WHERE TRUE);
DELETE FROM "attendance_attendancelatecomeearlyout" WHERE TRUE;

-- attendance.AttendanceDailyHours
DELETE FROM "attendance_attendancedailyhours" WHERE TRUE;

-- attendance.AttendanceSummaryHours
DELETE FROM "attendance_attendancesummaryhours" WHERE TRUE;

-- attendance.WorkRecords
DELETE FROM "attendance_workrecords" WHERE TRUE;

-- attendance.AttendanceOverTime
DELETE FROM "attendance_attendanceovertime" WHERE TRUE;

-- attendance.AttendanceActivity
DELETE FROM "attendance_attendanceactivity" WHERE TRUE;

-- attendance.Attendance
DELETE FROM "leave_compensatoryleaverequest_attendance_id" WHERE "attendance_id" IN (SELECT "id" FROM "attendance_attendance" WHERE TRUE);
DELETE FROM "attendance_attendancerequestcomment_files" WHERE "attendancerequestcomment_id" IN (SELECT "id" FROM "attendance_attendancerequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "attendance_attendance" WHERE TRUE));
DELETE FROM "attendance_attendancerequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "attendance_attendance" WHERE TRUE);
UPDATE "attendance_workrecords" SET "attendance_id_id" = NULL WHERE "attendance_id_id" IN (SELECT "id" FROM "attendance_attendance" WHERE TRUE);
DELETE FROM "attendance_attendance" WHERE TRUE;

-- attendance.BatchAttendance
DELETE FROM "attendance_batchattendance" WHERE TRUE;

-- leave.LeaveRequestConditionApproval
DELETE FROM "leave_leaverequestconditionapproval" WHERE TRUE;

-- leave.LeaverequestComment
DELETE FROM "leave_leaverequestcomment_files" WHERE "leaverequestcomment_id" IN (SELECT "id" FROM "leave_leaverequestcomment" WHERE TRUE);
DELETE FROM "leave_leaverequestcomment" WHERE TRUE;

-- leave.LeaverequestFile
DELETE FROM "leave_leaverequestcomment_files" WHERE "leaverequestfile_id" IN (SELECT "id" FROM "leave_leaverequestfile" WHERE TRUE);
DELETE FROM "leave_leaveallocationrequestcomment_files" WHERE "leaverequestfile_id" IN (SELECT "id" FROM "leave_leaverequestfile" WHERE TRUE);
DELETE FROM "leave_compensatoryleaverequestcomment_files" WHERE "leaverequestfile_id" IN (SELECT "id" FROM "leave_leaverequestfile" WHERE TRUE);
DELETE FROM "leave_leaverequestfile" WHERE TRUE;

-- leave.LeaveRequest
DELETE FROM "base_penaltyaccounts" WHERE "leave_request_id_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE TRUE);
DELETE FROM "leave_leaverequestcomment_files" WHERE "leaverequestcomment_id" IN (SELECT "id" FROM "leave_leaverequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE TRUE));
DELETE FROM "leave_leaverequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE TRUE);
DELETE FROM "leave_leaverequestconditionapproval" WHERE "leave_request_id_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE TRUE);
DELETE FROM "base_penaltyaccounts" WHERE "leave_request_id_id" IN (SELECT "id" FROM "leave_overrideleaverequests" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE TRUE));
DELETE FROM "leave_leaverequestcomment_files" WHERE "leaverequestcomment_id" IN (SELECT "id" FROM "leave_leaverequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "leave_overrideleaverequests" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE TRUE)));
DELETE FROM "leave_leaverequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "leave_overrideleaverequests" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE TRUE));
DELETE FROM "leave_leaverequestconditionapproval" WHERE "leave_request_id_id" IN (SELECT "id" FROM "leave_overrideleaverequests" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE TRUE));
UPDATE "attendance_workrecords" SET "leave_request_id_id" = NULL WHERE "leave_request_id_id" IN (SELECT "id" FROM "leave_overrideleaverequests" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE TRUE));
DELETE FROM "leave_overrideleaverequests" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE TRUE);
UPDATE "attendance_workrecords" SET "leave_request_id_id" = NULL WHERE "leave_request_id_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE TRUE);
DELETE FROM "base_penaltyaccounts" WHERE "leave_request_id_id" IN (SELECT "id" FROM "payroll_overrideleaverequest" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE TRUE));
DELETE FROM "leave_leaverequestcomment_files" WHERE "leaverequestcomment_id" IN (SELECT "id" FROM "leave_leaverequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "payroll_overrideleaverequest" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE TRUE)));
DELETE FROM "leave_leaverequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "payroll_overrideleaverequest" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE TRUE));
DELETE FROM "leave_leaverequestconditionapproval" WHERE "leave_request_id_id" IN (SELECT "id" FROM "payroll_overrideleaverequest" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE TRUE));
UPDATE "attendance_workrecords" SET "leave_request_id_id" = NULL WHERE "leave_request_id_id" IN (SELECT "id" FROM "payroll_overrideleaverequest" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE TRUE));
DELETE FROM "payroll_overrideleaverequest" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE TRUE);
DELETE FROM "leave_leaverequest" WHERE TRUE;

-- leave.LeaveallocationrequestComment
DELETE FROM "leave_leaveallocationrequestcomment_files" WHERE "leaveallocationrequestcomment_id" IN (SELECT "id" FROM "leave_leaveallocationrequestcomment" WHERE TRUE);
DELETE FROM "leave_leaveallocationrequestcomment" WHERE TRUE;

-- leave.LeaveAllocationRequest
DELETE FROM "leave_leaveallocationrequestcomment_files" WHERE "leaveallocationrequestcomment_id" IN (SELECT "id" FROM "leave_leaveallocationrequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "leave_leaveallocationrequest" WHERE TRUE));
DELETE FROM "leave_leaveallocationrequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "leave_leaveallocationrequest" WHERE TRUE);
DELETE FROM "leave_leaveallocationrequest" WHERE TRUE;

-- leave.AvailableLeave
DELETE FROM "leave_availableleave" WHERE TRUE;

-- leave.EmployeePastLeaveRestrict
DELETE FROM "leave_employeepastleaverestrict" WHERE TRUE;

-- asset.AssetServiceRequestNote
DELETE FROM "asset_assetservicerequestnote" WHERE TRUE;

-- asset.AssetServiceRequest
DELETE FROM "asset_assetservicerequestnote" WHERE "request_id_id" IN (SELECT "id" FROM "asset_assetservicerequest" WHERE TRUE);
DELETE FROM "asset_assetservicerequest" WHERE TRUE;

-- asset.AssetRequestComment
DELETE FROM "asset_assetrequestcomment" WHERE TRUE;

-- asset.AssetRequest
DELETE FROM "asset_assetrequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "asset_assetrequest" WHERE TRUE);
DELETE FROM "asset_assetrequest" WHERE TRUE;

-- asset.ReturnImages
DELETE FROM "asset_assetassignment_return_images" WHERE "returnimages_id" IN (SELECT "id" FROM "asset_returnimages" WHERE TRUE);
DELETE FROM "asset_assetassignment_assign_images" WHERE "returnimages_id" IN (SELECT "id" FROM "asset_returnimages" WHERE TRUE);
DELETE FROM "asset_returnimages" WHERE TRUE;

-- asset.AssetAssignment
DELETE FROM "asset_assetassignment_return_images" WHERE "assetassignment_id" IN (SELECT "id" FROM "asset_assetassignment" WHERE TRUE);
DELETE FROM "asset_assetassignment_assign_images" WHERE "assetassignment_id" IN (SELECT "id" FROM "asset_assetassignment" WHERE TRUE);
DELETE FROM "asset_assetservicerequestnote" WHERE "request_id_id" IN (SELECT "id" FROM "asset_assetservicerequest" WHERE "assignment_id_id" IN (SELECT "id" FROM "asset_assetassignment" WHERE TRUE));
DELETE FROM "asset_assetservicerequest" WHERE "assignment_id_id" IN (SELECT "id" FROM "asset_assetassignment" WHERE TRUE);
DELETE FROM "asset_assetassignment" WHERE TRUE;

-- asset.AssetDocuments
DELETE FROM "asset_assetdocuments" WHERE TRUE;

-- asset.AssetReport
DELETE FROM "asset_assetdocuments" WHERE "asset_report_id" IN (SELECT "id" FROM "asset_assetreport" WHERE TRUE);
DELETE FROM "asset_assetreport" WHERE TRUE;

-- asset.AssetItem
DELETE FROM "asset_assetitem" WHERE TRUE;

-- asset.Asset
DELETE FROM "asset_assetitem" WHERE "asset_id_id" IN (SELECT "id" FROM "asset_asset" WHERE TRUE);
DELETE FROM "asset_assetdocuments" WHERE "asset_report_id" IN (SELECT "id" FROM "asset_assetreport" WHERE "asset_id_id" IN (SELECT "id" FROM "asset_asset" WHERE TRUE));
DELETE FROM "asset_assetreport" WHERE "asset_id_id" IN (SELECT "id" FROM "asset_asset" WHERE TRUE);
DELETE FROM "asset_asset" WHERE TRUE;

-- asset.AssetLot
DELETE FROM "asset_assetlot_company_id" WHERE "assetlot_id" IN (SELECT "id" FROM "asset_assetlot" WHERE TRUE);
DELETE FROM "asset_assetlot" WHERE TRUE;

-- payroll.ReimbursementrequestComment
DELETE FROM "payroll_reimbursementrequestcomment_files" WHERE "reimbursementrequestcomment_id" IN (SELECT "id" FROM "payroll_reimbursementrequestcomment" WHERE TRUE);
DELETE FROM "payroll_reimbursementrequestcomment" WHERE TRUE;

-- payroll.ReimbursementFile
DELETE FROM "payroll_reimbursementrequestcomment_files" WHERE "reimbursementfile_id" IN (SELECT "id" FROM "payroll_reimbursementfile" WHERE TRUE);
DELETE FROM "payroll_reimbursementfile" WHERE TRUE;

-- payroll.Reimbursement
DELETE FROM "payroll_reimbursement_other_attachments" WHERE "reimbursement_id" IN (SELECT "id" FROM "payroll_reimbursement" WHERE TRUE);
DELETE FROM "payroll_reimbursementrequestcomment_files" WHERE "reimbursementrequestcomment_id" IN (SELECT "id" FROM "payroll_reimbursementrequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "payroll_reimbursement" WHERE TRUE));
DELETE FROM "payroll_reimbursementrequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "payroll_reimbursement" WHERE TRUE);
DELETE FROM "payroll_reimbursement" WHERE TRUE;

-- payroll.ReimbursementMultipleAttachment
DELETE FROM "payroll_reimbursement_other_attachments" WHERE "reimbursementmultipleattachment_id" IN (SELECT "id" FROM "payroll_reimbursementmultipleattachment" WHERE TRUE);
DELETE FROM "payroll_reimbursementmultipleattachment" WHERE TRUE;

-- payroll.LoanAccount
DELETE FROM "payroll_loanaccount_deduction_ids" WHERE "loanaccount_id" IN (SELECT "id" FROM "payroll_loanaccount" WHERE TRUE);
DELETE FROM "payroll_loanaccount" WHERE TRUE;

-- payroll.Payslip
DELETE FROM "payroll_payslip_installment_ids" WHERE "payslip_id" IN (SELECT "id" FROM "payroll_payslip" WHERE TRUE);
DELETE FROM "payroll_payslip" WHERE TRUE;

-- payroll.WorkRecord
DELETE FROM "payroll_workrecord" WHERE TRUE;

-- payroll.Contract
DELETE FROM "payroll_contract" WHERE TRUE;

-- onboarding.CandidateTask
DELETE FROM "onboarding_candidatetask" WHERE TRUE;

-- onboarding.CandidateStage
DELETE FROM "onboarding_candidatestage" WHERE TRUE;

-- onboarding.OnboardingPortal
DELETE FROM "onboarding_onboardingportal" WHERE TRUE;

-- recruitment.CandidateDocument
DELETE FROM "recruitment_candidatedocument" WHERE TRUE;

-- recruitment.CandidateDocumentRequest
DELETE FROM "recruitment_candidatedocumentrequest_candidate_id" WHERE "candidatedocumentrequest_id" IN (SELECT "id" FROM "recruitment_candidatedocumentrequest" WHERE TRUE);
DELETE FROM "recruitment_candidatedocumentrequest" WHERE TRUE;

-- recruitment.InterviewSchedule
DELETE FROM "recruitment_interviewschedule_employee_id" WHERE "interviewschedule_id" IN (SELECT "id" FROM "recruitment_interviewschedule" WHERE TRUE);
DELETE FROM "horilla_meet_interviewmeetinglink" WHERE "interview_id" IN (SELECT "id" FROM "recruitment_interviewschedule" WHERE TRUE);
DELETE FROM "recruitment_interviewschedule" WHERE TRUE;

-- recruitment.CandidateRating
DELETE FROM "recruitment_candidaterating" WHERE TRUE;

-- recruitment.SkillZoneCandidate
DELETE FROM "recruitment_skillzonecandidate" WHERE TRUE;

-- recruitment.RecruitmentSurveyAnswer
DELETE FROM "recruitment_recruitmentsurveyanswer" WHERE TRUE;

-- recruitment.StageNote
DELETE FROM "recruitment_stagenote_stage_files" WHERE "stagenote_id" IN (SELECT "id" FROM "recruitment_stagenote" WHERE TRUE);
DELETE FROM "recruitment_stagenote" WHERE TRUE;

-- recruitment.StageFiles
DELETE FROM "recruitment_stagenote_stage_files" WHERE "stagefiles_id" IN (SELECT "id" FROM "recruitment_stagefiles" WHERE TRUE);
DELETE FROM "recruitment_stagefiles" WHERE TRUE;

-- recruitment.RejectedCandidate
DELETE FROM "recruitment_rejectedcandidate_reject_reason_id" WHERE "rejectedcandidate_id" IN (SELECT "id" FROM "recruitment_rejectedcandidate" WHERE TRUE);
DELETE FROM "recruitment_rejectedcandidate" WHERE TRUE;

-- recruitment.Resume
DELETE FROM "recruitment_resume" WHERE TRUE;

-- recruitment.Candidate
DELETE FROM "recruitment_stagenote_stage_files" WHERE "stagenote_id" IN (SELECT "id" FROM "recruitment_stagenote" WHERE "candidate_id_id" IN (SELECT "id" FROM "recruitment_candidate" WHERE TRUE));
DELETE FROM "recruitment_stagenote" WHERE "candidate_id_id" IN (SELECT "id" FROM "recruitment_candidate" WHERE TRUE);
DELETE FROM "recruitment_recruitmentsurveyanswer" WHERE "candidate_id_id" IN (SELECT "id" FROM "recruitment_candidate" WHERE TRUE);
DELETE FROM "recruitment_interviewschedule_employee_id" WHERE "interviewschedule_id" IN (SELECT "id" FROM "recruitment_interviewschedule" WHERE "candidate_id_id" IN (SELECT "id" FROM "recruitment_candidate" WHERE TRUE));
DELETE FROM "horilla_meet_interviewmeetinglink" WHERE "interview_id" IN (SELECT "id" FROM "recruitment_interviewschedule" WHERE "candidate_id_id" IN (SELECT "id" FROM "recruitment_candidate" WHERE TRUE));
DELETE FROM "recruitment_interviewschedule" WHERE "candidate_id_id" IN (SELECT "id" FROM "recruitment_candidate" WHERE TRUE);
DELETE FROM "recruitment_candidatedocumentrequest_candidate_id" WHERE "candidate_id" IN (SELECT "id" FROM "recruitment_candidate" WHERE TRUE);
DELETE FROM "onboarding_onboardingtask_candidates" WHERE "candidate_id" IN (SELECT "id" FROM "recruitment_candidate" WHERE TRUE);
DELETE FROM "recruitment_candidate" WHERE TRUE;

-- recruitment.Stage
DELETE FROM "recruitment_stage_stage_managers" WHERE "stage_id" IN (SELECT "id" FROM "recruitment_stage" WHERE TRUE);
DELETE FROM "recruitment_stagenote_stage_files" WHERE "stagenote_id" IN (SELECT "id" FROM "recruitment_stagenote" WHERE "stage_id_id" IN (SELECT "id" FROM "recruitment_stage" WHERE TRUE));
DELETE FROM "recruitment_stagenote" WHERE "stage_id_id" IN (SELECT "id" FROM "recruitment_stage" WHERE TRUE);
DELETE FROM "recruitment_stage" WHERE TRUE;

-- recruitment.Recruitment
DELETE FROM "recruitment_recruitment_open_positions" WHERE "recruitment_id" IN (SELECT "id" FROM "recruitment_recruitment" WHERE TRUE);
DELETE FROM "recruitment_recruitment_recruitment_managers" WHERE "recruitment_id" IN (SELECT "id" FROM "recruitment_recruitment" WHERE TRUE);
DELETE FROM "recruitment_recruitment_survey_templates" WHERE "recruitment_id" IN (SELECT "id" FROM "recruitment_recruitment" WHERE TRUE);
DELETE FROM "recruitment_recruitment_skills" WHERE "recruitment_id" IN (SELECT "id" FROM "recruitment_recruitment" WHERE TRUE);
DELETE FROM "recruitment_stage_stage_managers" WHERE "stage_id" IN (SELECT "id" FROM "recruitment_stage" WHERE "recruitment_id_id" IN (SELECT "id" FROM "recruitment_recruitment" WHERE TRUE));
DELETE FROM "recruitment_stagenote_stage_files" WHERE "stagenote_id" IN (SELECT "id" FROM "recruitment_stagenote" WHERE "stage_id_id" IN (SELECT "id" FROM "recruitment_stage" WHERE "recruitment_id_id" IN (SELECT "id" FROM "recruitment_recruitment" WHERE TRUE)));
DELETE FROM "recruitment_stagenote" WHERE "stage_id_id" IN (SELECT "id" FROM "recruitment_stage" WHERE "recruitment_id_id" IN (SELECT "id" FROM "recruitment_recruitment" WHERE TRUE));
DELETE FROM "recruitment_stage" WHERE "recruitment_id_id" IN (SELECT "id" FROM "recruitment_recruitment" WHERE TRUE);
DELETE FROM "recruitment_recruitmentsurvey_recruitment_ids" WHERE "recruitment_id" IN (SELECT "id" FROM "recruitment_recruitment" WHERE TRUE);
DELETE FROM "recruitment_questionordering" WHERE "recruitment_id_id" IN (SELECT "id" FROM "recruitment_recruitment" WHERE TRUE);
DELETE FROM "recruitment_resume" WHERE "recruitment_id_id" IN (SELECT "id" FROM "recruitment_recruitment" WHERE TRUE);
DELETE FROM "onboarding_onboardingstage_employee_id" WHERE "onboardingstage_id" IN (SELECT "id" FROM "onboarding_onboardingstage" WHERE "recruitment_id_id" IN (SELECT "id" FROM "recruitment_recruitment" WHERE TRUE));
DELETE FROM "onboarding_onboardingtask_candidates" WHERE "onboardingtask_id" IN (SELECT "id" FROM "onboarding_onboardingtask" WHERE "stage_id_id" IN (SELECT "id" FROM "onboarding_onboardingstage" WHERE "recruitment_id_id" IN (SELECT "id" FROM "recruitment_recruitment" WHERE TRUE)));
DELETE FROM "onboarding_onboardingtask_employee_id" WHERE "onboardingtask_id" IN (SELECT "id" FROM "onboarding_onboardingtask" WHERE "stage_id_id" IN (SELECT "id" FROM "onboarding_onboardingstage" WHERE "recruitment_id_id" IN (SELECT "id" FROM "recruitment_recruitment" WHERE TRUE)));
DELETE FROM "onboarding_onboardingtask" WHERE "stage_id_id" IN (SELECT "id" FROM "onboarding_onboardingstage" WHERE "recruitment_id_id" IN (SELECT "id" FROM "recruitment_recruitment" WHERE TRUE));
DELETE FROM "onboarding_onboardingstage" WHERE "recruitment_id_id" IN (SELECT "id" FROM "recruitment_recruitment" WHERE TRUE);
DELETE FROM "recruitment_recruitment" WHERE TRUE;

-- offboarding.OffboardingNote
DELETE FROM "offboarding_offboardingnote_attachments" WHERE "offboardingnote_id" IN (SELECT "id" FROM "offboarding_offboardingnote" WHERE TRUE);
DELETE FROM "offboarding_offboardingnote" WHERE TRUE;

-- offboarding.EmployeeTask
DELETE FROM "offboarding_employeetask" WHERE TRUE;

-- offboarding.ResignationLetter
DELETE FROM "offboarding_resignationletter" WHERE TRUE;

-- offboarding.OffboardingEmployee
DELETE FROM "offboarding_resignationletter" WHERE "offboarding_employee_id_id" IN (SELECT "id" FROM "offboarding_offboardingemployee" WHERE TRUE);
DELETE FROM "offboarding_employeetask" WHERE "employee_id_id" IN (SELECT "id" FROM "offboarding_offboardingemployee" WHERE TRUE);
DELETE FROM "offboarding_exitreason_attachments" WHERE "exitreason_id" IN (SELECT "id" FROM "offboarding_exitreason" WHERE "offboarding_employee_id_id" IN (SELECT "id" FROM "offboarding_offboardingemployee" WHERE TRUE));
DELETE FROM "offboarding_exitreason" WHERE "offboarding_employee_id_id" IN (SELECT "id" FROM "offboarding_offboardingemployee" WHERE TRUE);
DELETE FROM "offboarding_offboardingnote_attachments" WHERE "offboardingnote_id" IN (SELECT "id" FROM "offboarding_offboardingnote" WHERE "employee_id_id" IN (SELECT "id" FROM "offboarding_offboardingemployee" WHERE TRUE));
DELETE FROM "offboarding_offboardingnote" WHERE "employee_id_id" IN (SELECT "id" FROM "offboarding_offboardingemployee" WHERE TRUE);
DELETE FROM "offboarding_offboardingemployee" WHERE TRUE;

-- pms.MeetingsAnswer
DELETE FROM "pms_meetingsanswer" WHERE TRUE;

-- pms.Meetings
DELETE FROM "pms_meetings_employee_id" WHERE "meetings_id" IN (SELECT "id" FROM "pms_meetings" WHERE TRUE);
DELETE FROM "pms_meetings_manager" WHERE "meetings_id" IN (SELECT "id" FROM "pms_meetings" WHERE TRUE);
DELETE FROM "pms_meetings_answer_employees" WHERE "meetings_id" IN (SELECT "id" FROM "pms_meetings" WHERE TRUE);
DELETE FROM "horilla_meet_pmsmeetinglink" WHERE "meeting_id" IN (SELECT "id" FROM "pms_meetings" WHERE TRUE);
DELETE FROM "pms_meetings" WHERE TRUE;

-- pms.KeyResultFeedback
DELETE FROM "pms_keyresultfeedback" WHERE TRUE;

-- pms.Answer
DELETE FROM "pms_answer" WHERE TRUE;

-- pms.AnonymousFeedback
DELETE FROM "pms_anonymousfeedback" WHERE TRUE;

-- pms.Feedback
DELETE FROM "pms_feedback_colleague_id" WHERE "feedback_id" IN (SELECT "id" FROM "pms_feedback" WHERE TRUE);
DELETE FROM "pms_feedback_subordinate_id" WHERE "feedback_id" IN (SELECT "id" FROM "pms_feedback" WHERE TRUE);
DELETE FROM "pms_feedback_others_id" WHERE "feedback_id" IN (SELECT "id" FROM "pms_feedback" WHERE TRUE);
DELETE FROM "pms_feedback_employee_key_results_id" WHERE "feedback_id" IN (SELECT "id" FROM "pms_feedback" WHERE TRUE);
DELETE FROM "pms_feedback" WHERE TRUE;

-- pms.Comment
DELETE FROM "pms_comment" WHERE TRUE;

-- pms.EmployeeKeyResult
DELETE FROM "pms_feedback_employee_key_results_id" WHERE "employeekeyresult_id" IN (SELECT "id" FROM "pms_employeekeyresult" WHERE TRUE);
DELETE FROM "pms_employeekeyresult" WHERE TRUE;

-- pms.EmployeeObjective
DELETE FROM "pms_employeeobjective_key_result_id" WHERE "employeeobjective_id" IN (SELECT "id" FROM "pms_employeeobjective" WHERE TRUE);
DELETE FROM "pms_comment" WHERE "employee_objective_id_id" IN (SELECT "id" FROM "pms_employeeobjective" WHERE TRUE);
DELETE FROM "pms_feedback_employee_key_results_id" WHERE "employeekeyresult_id" IN (SELECT "id" FROM "pms_employeekeyresult" WHERE "employee_objective_id_id" IN (SELECT "id" FROM "pms_employeeobjective" WHERE TRUE));
DELETE FROM "pms_employeekeyresult" WHERE "employee_objective_id_id" IN (SELECT "id" FROM "pms_employeeobjective" WHERE TRUE);
DELETE FROM "pms_employeeobjective" WHERE TRUE;

-- pms.Objective
DELETE FROM "pms_objective_managers" WHERE "objective_id" IN (SELECT "id" FROM "pms_objective" WHERE TRUE);
DELETE FROM "pms_objective_assignees" WHERE "objective_id" IN (SELECT "id" FROM "pms_objective" WHERE TRUE);
DELETE FROM "pms_objective_key_result_id" WHERE "objective_id" IN (SELECT "id" FROM "pms_objective" WHERE TRUE);
DELETE FROM "pms_objective" WHERE TRUE;

-- pms.EmployeeBonusPoint
DELETE FROM "pms_employeebonuspoint" WHERE TRUE;

-- project.TimeSheet
DELETE FROM "project_timesheet" WHERE TRUE;

-- project.Task
DELETE FROM "project_task_task_managers" WHERE "task_id" IN (SELECT "id" FROM "project_task" WHERE TRUE);
DELETE FROM "project_task_task_members" WHERE "task_id" IN (SELECT "id" FROM "project_task" WHERE TRUE);
DELETE FROM "project_timesheet" WHERE "task_id_id" IN (SELECT "id" FROM "project_task" WHERE TRUE);
DELETE FROM "project_task" WHERE TRUE;

-- project.ProjectStage
DELETE FROM "project_task_task_managers" WHERE "task_id" IN (SELECT "id" FROM "project_task" WHERE "stage_id" IN (SELECT "id" FROM "project_projectstage" WHERE TRUE));
DELETE FROM "project_task_task_members" WHERE "task_id" IN (SELECT "id" FROM "project_task" WHERE "stage_id" IN (SELECT "id" FROM "project_projectstage" WHERE TRUE));
DELETE FROM "project_timesheet" WHERE "task_id_id" IN (SELECT "id" FROM "project_task" WHERE "stage_id" IN (SELECT "id" FROM "project_projectstage" WHERE TRUE));
DELETE FROM "project_task" WHERE "stage_id" IN (SELECT "id" FROM "project_projectstage" WHERE TRUE);
DELETE FROM "project_projectstage" WHERE TRUE;

-- project.Project
DELETE FROM "project_project_managers" WHERE "project_id" IN (SELECT "id" FROM "project_project" WHERE TRUE);
DELETE FROM "project_task_task_managers" WHERE "task_id" IN (SELECT "id" FROM "project_task" WHERE "stage_id" IN (SELECT "id" FROM "project_projectstage" WHERE "project_id" IN (SELECT "id" FROM "project_project" WHERE TRUE)));
DELETE FROM "project_task_task_members" WHERE "task_id" IN (SELECT "id" FROM "project_task" WHERE "stage_id" IN (SELECT "id" FROM "project_projectstage" WHERE "project_id" IN (SELECT "id" FROM "project_project" WHERE TRUE)));
DELETE FROM "project_timesheet" WHERE "task_id_id" IN (SELECT "id" FROM "project_task" WHERE "stage_id" IN (SELECT "id" FROM "project_projectstage" WHERE "project_id" IN (SELECT "id" FROM "project_project" WHERE TRUE)));
DELETE FROM "project_task" WHERE "stage_id" IN (SELECT "id" FROM "project_projectstage" WHERE "project_id" IN (SELECT "id" FROM "project_project" WHERE TRUE));
DELETE FROM "project_projectstage" WHERE "project_id" IN (SELECT "id" FROM "project_project" WHERE TRUE);
DELETE FROM "project_task_task_managers" WHERE "task_id" IN (SELECT "id" FROM "project_task" WHERE "project_id" IN (SELECT "id" FROM "project_project" WHERE TRUE));
DELETE FROM "project_task_task_members" WHERE "task_id" IN (SELECT "id" FROM "project_task" WHERE "project_id" IN (SELECT "id" FROM "project_project" WHERE TRUE));
DELETE FROM "project_timesheet" WHERE "task_id_id" IN (SELECT "id" FROM "project_task" WHERE "project_id" IN (SELECT "id" FROM "project_project" WHERE TRUE));
DELETE FROM "project_task" WHERE "project_id" IN (SELECT "id" FROM "project_project" WHERE TRUE);
DELETE FROM "project_timesheet" WHERE "project_id_id" IN (SELECT "id" FROM "project_project" WHERE TRUE);
DELETE FROM "project_project" WHERE TRUE;

-- helpdesk.Attachment
DELETE FROM "helpdesk_attachment" WHERE TRUE;

-- helpdesk.Comment
DELETE FROM "helpdesk_attachment" WHERE "comment_id" IN (SELECT "id" FROM "helpdesk_comment" WHERE TRUE);
DELETE FROM "helpdesk_comment" WHERE TRUE;

-- helpdesk.ClaimRequest
DELETE FROM "helpdesk_claimrequest" WHERE TRUE;

-- helpdesk.Ticket
DELETE FROM "helpdesk_ticket_assigned_to" WHERE "ticket_id" IN (SELECT "id" FROM "helpdesk_ticket" WHERE TRUE);
DELETE FROM "helpdesk_ticket_tags" WHERE "ticket_id" IN (SELECT "id" FROM "helpdesk_ticket" WHERE TRUE);
DELETE FROM "helpdesk_claimrequest" WHERE "ticket_id_id" IN (SELECT "id" FROM "helpdesk_ticket" WHERE TRUE);
DELETE FROM "helpdesk_attachment" WHERE "comment_id" IN (SELECT "id" FROM "helpdesk_comment" WHERE "ticket_id" IN (SELECT "id" FROM "helpdesk_ticket" WHERE TRUE));
DELETE FROM "helpdesk_comment" WHERE "ticket_id" IN (SELECT "id" FROM "helpdesk_ticket" WHERE TRUE);
DELETE FROM "helpdesk_attachment" WHERE "ticket_id" IN (SELECT "id" FROM "helpdesk_ticket" WHERE TRUE);
DELETE FROM "helpdesk_ticket" WHERE TRUE;

-- helpdesk.FAQ
DELETE FROM "helpdesk_faq_tags" WHERE "faq_id" IN (SELECT "id" FROM "helpdesk_faq" WHERE TRUE);
DELETE FROM "helpdesk_faq" WHERE TRUE;

-- helpdesk.FAQCategory
DELETE FROM "helpdesk_faqcategory" WHERE TRUE;

-- employee.Employee (except those linked to superusers)
DELETE FROM "base_roster" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
UPDATE "base_roster" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
UPDATE "base_rosterpublishlog" SET "published_by_id" = NULL WHERE "published_by_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "base_worktyperequestcomment_files" WHERE "worktyperequestcomment_id" IN (SELECT "id" FROM "base_worktyperequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "base_worktyperequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "base_shiftrequestcomment_files" WHERE "shiftrequestcomment_id" IN (SELECT "id" FROM "base_shiftrequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "base_shiftrequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "base_announcement_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "base_announcement_filtered_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "base_announcementcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "base_dashboardemployeecharts" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "base_holidays_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "base_notificationsound" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "employee_employeeworkinformation_tags" WHERE "employeeworkinformation_id" IN (SELECT "id" FROM "employee_employeeworkinformation" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "employee_employeeworkinformation" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "employee_employeebankdetails" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "employee_employeenote_note_files" WHERE "employeenote_id" IN (SELECT "id" FROM "employee_employeenote" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "employee_employeenote" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "employee_employeenote_note_files" WHERE "employeenote_id" IN (SELECT "id" FROM "employee_employeenote" WHERE "updated_by_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "employee_employeenote" WHERE "updated_by_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "employee_policy_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "employee_policy_filtered_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "pms_employeebonuspoint" WHERE "bonus_point_id_id" IN (SELECT "id" FROM "employee_bonuspoint" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "employee_bonuspoint" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "employee_disciplinaryaction_employee_id" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "recruitment_recruitment_recruitment_managers" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "recruitment_stage_stage_managers" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
UPDATE "recruitment_candidate" SET "converted_employee_id_id" = NULL WHERE "converted_employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "recruitment_stagenote_stage_files" WHERE "stagenote_id" IN (SELECT "id" FROM "recruitment_stagenote" WHERE "candidate_id_id" IN (SELECT "id" FROM "recruitment_candidate" WHERE "referral_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)))));
DELETE FROM "recruitment_stagenote" WHERE "candidate_id_id" IN (SELECT "id" FROM "recruitment_candidate" WHERE "referral_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "recruitment_recruitmentsurveyanswer" WHERE "candidate_id_id" IN (SELECT "id" FROM "recruitment_candidate" WHERE "referral_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "recruitment_interviewschedule_employee_id" WHERE "interviewschedule_id" IN (SELECT "id" FROM "recruitment_interviewschedule" WHERE "candidate_id_id" IN (SELECT "id" FROM "recruitment_candidate" WHERE "referral_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)))));
DELETE FROM "horilla_meet_interviewmeetinglink" WHERE "interview_id" IN (SELECT "id" FROM "recruitment_interviewschedule" WHERE "candidate_id_id" IN (SELECT "id" FROM "recruitment_candidate" WHERE "referral_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)))));
DELETE FROM "recruitment_interviewschedule" WHERE "candidate_id_id" IN (SELECT "id" FROM "recruitment_candidate" WHERE "referral_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "recruitment_candidatedocumentrequest_candidate_id" WHERE "candidate_id" IN (SELECT "id" FROM "recruitment_candidate" WHERE "referral_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "onboarding_onboardingtask_candidates" WHERE "candidate_id" IN (SELECT "id" FROM "recruitment_candidate" WHERE "referral_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "recruitment_candidate" WHERE "referral_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "recruitment_stagenote_stage_files" WHERE "stagenote_id" IN (SELECT "id" FROM "recruitment_stagenote" WHERE "updated_by_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "recruitment_stagenote" WHERE "updated_by_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "recruitment_interviewschedule_employee_id" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "leave_availableleave" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "base_penaltyaccounts" WHERE "leave_request_id_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "leave_leaverequestcomment_files" WHERE "leaverequestcomment_id" IN (SELECT "id" FROM "leave_leaverequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)))));
DELETE FROM "leave_leaverequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "leave_leaverequestconditionapproval" WHERE "leave_request_id_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "base_penaltyaccounts" WHERE "leave_request_id_id" IN (SELECT "id" FROM "leave_overrideleaverequests" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)))));
DELETE FROM "leave_leaverequestcomment_files" WHERE "leaverequestcomment_id" IN (SELECT "id" FROM "leave_leaverequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "leave_overrideleaverequests" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))))));
DELETE FROM "leave_leaverequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "leave_overrideleaverequests" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)))));
DELETE FROM "leave_leaverequestconditionapproval" WHERE "leave_request_id_id" IN (SELECT "id" FROM "leave_overrideleaverequests" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)))));
UPDATE "attendance_workrecords" SET "leave_request_id_id" = NULL WHERE "leave_request_id_id" IN (SELECT "id" FROM "leave_overrideleaverequests" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)))));
DELETE FROM "leave_overrideleaverequests" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
UPDATE "attendance_workrecords" SET "leave_request_id_id" = NULL WHERE "leave_request_id_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "base_penaltyaccounts" WHERE "leave_request_id_id" IN (SELECT "id" FROM "payroll_overrideleaverequest" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)))));
DELETE FROM "leave_leaverequestcomment_files" WHERE "leaverequestcomment_id" IN (SELECT "id" FROM "leave_leaverequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "payroll_overrideleaverequest" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))))));
DELETE FROM "leave_leaverequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "payroll_overrideleaverequest" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)))));
DELETE FROM "leave_leaverequestconditionapproval" WHERE "leave_request_id_id" IN (SELECT "id" FROM "payroll_overrideleaverequest" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)))));
UPDATE "attendance_workrecords" SET "leave_request_id_id" = NULL WHERE "leave_request_id_id" IN (SELECT "id" FROM "payroll_overrideleaverequest" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)))));
DELETE FROM "payroll_overrideleaverequest" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "leave_leaverequestcomment_files" WHERE "leaverequestcomment_id" IN (SELECT "id" FROM "leave_leaverequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "leave_leaverequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "leave_leaveallocationrequestcomment_files" WHERE "leaveallocationrequestcomment_id" IN (SELECT "id" FROM "leave_leaveallocationrequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "leave_leaveallocationrequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)))));
DELETE FROM "leave_leaveallocationrequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "leave_leaveallocationrequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "leave_leaveallocationrequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "leave_leaveallocationrequestcomment_files" WHERE "leaveallocationrequestcomment_id" IN (SELECT "id" FROM "leave_leaveallocationrequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "leave_leaveallocationrequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "leave_leaverequestconditionapproval" WHERE "manager_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "leave_compensatoryleaverequest_attendance_id" WHERE "compensatoryleaverequest_id" IN (SELECT "id" FROM "leave_compensatoryleaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "leave_compensatoryleaverequestcomment_files" WHERE "compensatoryleaverequestcomment_id" IN (SELECT "id" FROM "leave_compensatoryleaverequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "leave_compensatoryleaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)))));
DELETE FROM "leave_compensatoryleaverequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "leave_compensatoryleaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "leave_compensatoryleaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "leave_compensatoryleaverequestcomment_files" WHERE "compensatoryleaverequestcomment_id" IN (SELECT "id" FROM "leave_compensatoryleaverequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "leave_compensatoryleaverequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "pms_objective_managers" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "pms_objective_assignees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "pms_feedback_colleague_id" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "pms_feedback_subordinate_id" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "pms_feedback_others_id" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "pms_anonymousfeedback" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "pms_meetings_employee_id" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "pms_meetings_manager" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "pms_meetings_answer_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "onboarding_onboardingstage_employee_id" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "onboarding_onboardingtask_employee_id" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "asset_assetrequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
UPDATE "asset_assetservicerequest" SET "resolved_by_employee_id_id" = NULL WHERE "resolved_by_employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "asset_assetservicerequestnote" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "attendance_attendancerequestcomment_files" WHERE "attendancerequestcomment_id" IN (SELECT "id" FROM "attendance_attendancerequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "attendance_attendancerequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "attendance_workrecords" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "attendance_attendanceconflictresolution" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "attendance_attendancesummaryhours" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "attendance_attendancedailyhours" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "payroll_allowance_specific_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "payroll_allowance_exclude_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "payroll_deduction_specific_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "payroll_deduction_exclude_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
UPDATE "payroll_reimbursement" SET "approved_by_id" = NULL WHERE "approved_by_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "payroll_reimbursementrequestcomment_files" WHERE "reimbursementrequestcomment_id" IN (SELECT "id" FROM "payroll_reimbursementrequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "payroll_reimbursementrequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "payroll_encashmentgeneralsettings_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "payroll_encashmentgeneralsettings_filtered_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "accessibility_defaultaccessibility_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "horilla_documents_documentrequest_employee_id" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "horilla_views_columnorder" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "horilla_automations_mailautomation_also_sent_to" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "biometric_biometricemployees" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "helpdesk_departmentmanager" WHERE "manager_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "helpdesk_ticket_assigned_to" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "helpdesk_claimrequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "offboarding_offboarding_managers" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "offboarding_offboardingstage_managers" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "offboarding_resignationletter" WHERE "offboarding_employee_id_id" IN (SELECT "id" FROM "offboarding_offboardingemployee" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "offboarding_employeetask" WHERE "employee_id_id" IN (SELECT "id" FROM "offboarding_offboardingemployee" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "offboarding_exitreason_attachments" WHERE "exitreason_id" IN (SELECT "id" FROM "offboarding_exitreason" WHERE "offboarding_employee_id_id" IN (SELECT "id" FROM "offboarding_offboardingemployee" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)))));
DELETE FROM "offboarding_exitreason" WHERE "offboarding_employee_id_id" IN (SELECT "id" FROM "offboarding_offboardingemployee" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "offboarding_offboardingnote_attachments" WHERE "offboardingnote_id" IN (SELECT "id" FROM "offboarding_offboardingnote" WHERE "employee_id_id" IN (SELECT "id" FROM "offboarding_offboardingemployee" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)))));
DELETE FROM "offboarding_offboardingnote" WHERE "employee_id_id" IN (SELECT "id" FROM "offboarding_offboardingemployee" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "offboarding_offboardingemployee" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "offboarding_resignationletter" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "offboarding_offboardingtask_managers" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
UPDATE "offboarding_offboardingnote" SET "note_by_id" = NULL WHERE "note_by_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "project_project_managers" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "project_task_task_managers" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "project_task_task_members" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "project_timesheet" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "horilla_meet_googlecredential" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "horilla_meet_interviewmeetinglink" WHERE "meeting_id" IN (SELECT "id" FROM "horilla_meet_googlemeeting" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "horilla_meet_pmsmeetinglink" WHERE "google_meeting_id" IN (SELECT "id" FROM "horilla_meet_googlemeeting" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser))));
DELETE FROM "horilla_meet_googlemeeting" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "report_reportsubscription_recipients_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "facedetection_employeefacedetection" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser)));
DELETE FROM "employee_employee" WHERE (employee_user_id_id IS NULL OR employee_user_id_id NOT IN (SELECT id FROM "horilla_auth_horillauser" WHERE is_superuser));

-- users (except superusers)
DELETE FROM "django_admin_log" WHERE "user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
DELETE FROM "notifications_notification" WHERE "recipient_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "auditlog_logentry" SET "actor_id" = NULL WHERE "actor_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "token_blacklist_outstandingtoken" SET "user_id" = NULL WHERE "user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
DELETE FROM "horilla_auth_horillauser_groups" WHERE "horillauser_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
DELETE FROM "horilla_auth_horillauser_user_permissions" WHERE "horillauser_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_theme_horillacolortheme" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_theme_horillacolortheme" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_theme_companytheme" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_theme_companytheme" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_company" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_company" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_companygroupassignment" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_companygroupassignment" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
DELETE FROM "base_companygroupassignment" WHERE "user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_department" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_department" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_jobposition" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_jobposition" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_jobrole" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_jobrole" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_worktype" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_worktype" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_rotatingworktype" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_rotatingworktype" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_historicalrotatingworktypeassign" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_rotatingworktypeassign" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_rotatingworktypeassign" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_employeetype" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_employeetype" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_employeeshift" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_employeeshift" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_employeeshiftschedule" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_employeeshiftschedule" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_rotatingshift" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_rotatingshift" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_historicalrotatingshiftassign" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_rotatingshiftassign" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_rotatingshiftassign" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_roster" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_historicalworktyperequest" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_worktyperequest" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_worktyperequest" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_worktyperequestcomment" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_worktyperequestcomment" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_historicalshiftrequest" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_shiftrequest" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_shiftrequest" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_shiftrequestcomment" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_shiftrequestcomment" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_tags" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_tags" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_horillamailtemplate" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_horillamailtemplate" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_dynamicemailconfiguration" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_dynamicemailconfiguration" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_multipleapprovalcondition" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_multipleapprovalcondition" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
DELETE FROM "base_dynamicpagination" WHERE "user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_announcement" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_announcement" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_announcementcomment" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_announcementcomment" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
DELETE FROM "base_announcementview" WHERE "user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
DELETE FROM "base_driverviewed" WHERE "user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_dashboardemployeecharts" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_dashboardemployeecharts" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_tracklatecomeearlyout" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_tracklatecomeearlyout" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_holidays" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_holidays" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_companyleaves" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_companyleaves" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_penaltyaccounts" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_penaltyaccounts" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_integrationapps" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_integrationapps" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
DELETE FROM "base_setupchecklistdismissal" WHERE "user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_defaultexportpermission" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_defaultexportpermission" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_companylanguagesetting" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "base_companylanguagesetting" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
DELETE FROM "base_roster" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
UPDATE "base_roster" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
UPDATE "base_rosterpublishlog" SET "published_by_id" = NULL WHERE "published_by_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "base_worktyperequestcomment_files" WHERE "worktyperequestcomment_id" IN (SELECT "id" FROM "base_worktyperequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "base_worktyperequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "base_shiftrequestcomment_files" WHERE "shiftrequestcomment_id" IN (SELECT "id" FROM "base_shiftrequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "base_shiftrequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "base_announcement_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "base_announcement_filtered_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "base_announcementcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "base_dashboardemployeecharts" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "base_holidays_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "base_notificationsound" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "employee_employeeworkinformation_tags" WHERE "employeeworkinformation_id" IN (SELECT "id" FROM "employee_employeeworkinformation" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "employee_employeeworkinformation" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "employee_employeebankdetails" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "employee_employeenote_note_files" WHERE "employeenote_id" IN (SELECT "id" FROM "employee_employeenote" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "employee_employeenote" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "employee_employeenote_note_files" WHERE "employeenote_id" IN (SELECT "id" FROM "employee_employeenote" WHERE "updated_by_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "employee_employeenote" WHERE "updated_by_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "employee_policy_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "employee_policy_filtered_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "pms_employeebonuspoint" WHERE "bonus_point_id_id" IN (SELECT "id" FROM "employee_bonuspoint" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "employee_bonuspoint" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "employee_disciplinaryaction_employee_id" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "recruitment_recruitment_recruitment_managers" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "recruitment_stage_stage_managers" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
UPDATE "recruitment_candidate" SET "converted_employee_id_id" = NULL WHERE "converted_employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "recruitment_stagenote_stage_files" WHERE "stagenote_id" IN (SELECT "id" FROM "recruitment_stagenote" WHERE "candidate_id_id" IN (SELECT "id" FROM "recruitment_candidate" WHERE "referral_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser))));
DELETE FROM "recruitment_stagenote" WHERE "candidate_id_id" IN (SELECT "id" FROM "recruitment_candidate" WHERE "referral_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "recruitment_recruitmentsurveyanswer" WHERE "candidate_id_id" IN (SELECT "id" FROM "recruitment_candidate" WHERE "referral_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "recruitment_interviewschedule_employee_id" WHERE "interviewschedule_id" IN (SELECT "id" FROM "recruitment_interviewschedule" WHERE "candidate_id_id" IN (SELECT "id" FROM "recruitment_candidate" WHERE "referral_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser))));
DELETE FROM "horilla_meet_interviewmeetinglink" WHERE "interview_id" IN (SELECT "id" FROM "recruitment_interviewschedule" WHERE "candidate_id_id" IN (SELECT "id" FROM "recruitment_candidate" WHERE "referral_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser))));
DELETE FROM "recruitment_interviewschedule" WHERE "candidate_id_id" IN (SELECT "id" FROM "recruitment_candidate" WHERE "referral_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "recruitment_candidatedocumentrequest_candidate_id" WHERE "candidate_id" IN (SELECT "id" FROM "recruitment_candidate" WHERE "referral_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "onboarding_onboardingtask_candidates" WHERE "candidate_id" IN (SELECT "id" FROM "recruitment_candidate" WHERE "referral_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "recruitment_candidate" WHERE "referral_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "recruitment_stagenote_stage_files" WHERE "stagenote_id" IN (SELECT "id" FROM "recruitment_stagenote" WHERE "updated_by_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "recruitment_stagenote" WHERE "updated_by_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "recruitment_interviewschedule_employee_id" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "leave_availableleave" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "base_penaltyaccounts" WHERE "leave_request_id_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "leave_leaverequestcomment_files" WHERE "leaverequestcomment_id" IN (SELECT "id" FROM "leave_leaverequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser))));
DELETE FROM "leave_leaverequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "leave_leaverequestconditionapproval" WHERE "leave_request_id_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "base_penaltyaccounts" WHERE "leave_request_id_id" IN (SELECT "id" FROM "leave_overrideleaverequests" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser))));
DELETE FROM "leave_leaverequestcomment_files" WHERE "leaverequestcomment_id" IN (SELECT "id" FROM "leave_leaverequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "leave_overrideleaverequests" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)))));
DELETE FROM "leave_leaverequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "leave_overrideleaverequests" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser))));
DELETE FROM "leave_leaverequestconditionapproval" WHERE "leave_request_id_id" IN (SELECT "id" FROM "leave_overrideleaverequests" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser))));
UPDATE "attendance_workrecords" SET "leave_request_id_id" = NULL WHERE "leave_request_id_id" IN (SELECT "id" FROM "leave_overrideleaverequests" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser))));
DELETE FROM "leave_overrideleaverequests" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
UPDATE "attendance_workrecords" SET "leave_request_id_id" = NULL WHERE "leave_request_id_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "base_penaltyaccounts" WHERE "leave_request_id_id" IN (SELECT "id" FROM "payroll_overrideleaverequest" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser))));
DELETE FROM "leave_leaverequestcomment_files" WHERE "leaverequestcomment_id" IN (SELECT "id" FROM "leave_leaverequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "payroll_overrideleaverequest" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)))));
DELETE FROM "leave_leaverequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "payroll_overrideleaverequest" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser))));
DELETE FROM "leave_leaverequestconditionapproval" WHERE "leave_request_id_id" IN (SELECT "id" FROM "payroll_overrideleaverequest" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser))));
UPDATE "attendance_workrecords" SET "leave_request_id_id" = NULL WHERE "leave_request_id_id" IN (SELECT "id" FROM "payroll_overrideleaverequest" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser))));
DELETE FROM "payroll_overrideleaverequest" WHERE "leaverequest_ptr_id" IN (SELECT "id" FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "leave_leaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "leave_leaverequestcomment_files" WHERE "leaverequestcomment_id" IN (SELECT "id" FROM "leave_leaverequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "leave_leaverequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "leave_leaveallocationrequestcomment_files" WHERE "leaveallocationrequestcomment_id" IN (SELECT "id" FROM "leave_leaveallocationrequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "leave_leaveallocationrequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser))));
DELETE FROM "leave_leaveallocationrequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "leave_leaveallocationrequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "leave_leaveallocationrequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "leave_leaveallocationrequestcomment_files" WHERE "leaveallocationrequestcomment_id" IN (SELECT "id" FROM "leave_leaveallocationrequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "leave_leaveallocationrequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "leave_leaverequestconditionapproval" WHERE "manager_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "leave_compensatoryleaverequest_attendance_id" WHERE "compensatoryleaverequest_id" IN (SELECT "id" FROM "leave_compensatoryleaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "leave_compensatoryleaverequestcomment_files" WHERE "compensatoryleaverequestcomment_id" IN (SELECT "id" FROM "leave_compensatoryleaverequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "leave_compensatoryleaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser))));
DELETE FROM "leave_compensatoryleaverequestcomment" WHERE "request_id_id" IN (SELECT "id" FROM "leave_compensatoryleaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "leave_compensatoryleaverequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "leave_compensatoryleaverequestcomment_files" WHERE "compensatoryleaverequestcomment_id" IN (SELECT "id" FROM "leave_compensatoryleaverequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "leave_compensatoryleaverequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "pms_objective_managers" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "pms_objective_assignees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "pms_feedback_colleague_id" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "pms_feedback_subordinate_id" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "pms_feedback_others_id" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "pms_anonymousfeedback" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "pms_meetings_employee_id" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "pms_meetings_manager" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "pms_meetings_answer_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "onboarding_onboardingstage_employee_id" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "onboarding_onboardingtask_employee_id" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "asset_assetrequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
UPDATE "asset_assetservicerequest" SET "resolved_by_employee_id_id" = NULL WHERE "resolved_by_employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "asset_assetservicerequestnote" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "attendance_attendancerequestcomment_files" WHERE "attendancerequestcomment_id" IN (SELECT "id" FROM "attendance_attendancerequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "attendance_attendancerequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "attendance_workrecords" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "attendance_attendanceconflictresolution" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "attendance_attendancesummaryhours" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "attendance_attendancedailyhours" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "payroll_allowance_specific_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "payroll_allowance_exclude_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "payroll_deduction_specific_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "payroll_deduction_exclude_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
UPDATE "payroll_reimbursement" SET "approved_by_id" = NULL WHERE "approved_by_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "payroll_reimbursementrequestcomment_files" WHERE "reimbursementrequestcomment_id" IN (SELECT "id" FROM "payroll_reimbursementrequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "payroll_reimbursementrequestcomment" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "payroll_encashmentgeneralsettings_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "payroll_encashmentgeneralsettings_filtered_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "accessibility_defaultaccessibility_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "horilla_documents_documentrequest_employee_id" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "horilla_views_columnorder" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "horilla_automations_mailautomation_also_sent_to" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "biometric_biometricemployees" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "helpdesk_departmentmanager" WHERE "manager_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "helpdesk_ticket_assigned_to" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "helpdesk_claimrequest" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "offboarding_offboarding_managers" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "offboarding_offboardingstage_managers" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "offboarding_resignationletter" WHERE "offboarding_employee_id_id" IN (SELECT "id" FROM "offboarding_offboardingemployee" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "offboarding_employeetask" WHERE "employee_id_id" IN (SELECT "id" FROM "offboarding_offboardingemployee" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "offboarding_exitreason_attachments" WHERE "exitreason_id" IN (SELECT "id" FROM "offboarding_exitreason" WHERE "offboarding_employee_id_id" IN (SELECT "id" FROM "offboarding_offboardingemployee" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser))));
DELETE FROM "offboarding_exitreason" WHERE "offboarding_employee_id_id" IN (SELECT "id" FROM "offboarding_offboardingemployee" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "offboarding_offboardingnote_attachments" WHERE "offboardingnote_id" IN (SELECT "id" FROM "offboarding_offboardingnote" WHERE "employee_id_id" IN (SELECT "id" FROM "offboarding_offboardingemployee" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser))));
DELETE FROM "offboarding_offboardingnote" WHERE "employee_id_id" IN (SELECT "id" FROM "offboarding_offboardingemployee" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "offboarding_offboardingemployee" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "offboarding_resignationletter" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "offboarding_offboardingtask_managers" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
UPDATE "offboarding_offboardingnote" SET "note_by_id" = NULL WHERE "note_by_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "project_project_managers" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "project_task_task_managers" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "project_task_task_members" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "project_timesheet" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "horilla_meet_googlecredential" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "horilla_meet_interviewmeetinglink" WHERE "meeting_id" IN (SELECT "id" FROM "horilla_meet_googlemeeting" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "horilla_meet_pmsmeetinglink" WHERE "google_meeting_id" IN (SELECT "id" FROM "horilla_meet_googlemeeting" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser)));
DELETE FROM "horilla_meet_googlemeeting" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "report_reportsubscription_recipients_employees" WHERE "employee_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "facedetection_employeefacedetection" WHERE "employee_id_id" IN (SELECT "id" FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser));
DELETE FROM "employee_employee" WHERE "employee_user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "employee_employeetag" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "employee_employeetag" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "employee_historicalemployeeworkinformation" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "employee_employeebankdetails" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "employee_employeebankdetails" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "employee_notefiles" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "employee_notefiles" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "employee_employeenote" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "employee_employeenote" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "employee_policymultiplefile" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "employee_policymultiplefile" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "employee_policy" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "employee_policy" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "employee_historicalbonuspoint" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "employee_bonuspoint" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "employee_bonuspoint" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "employee_actiontype" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "employee_actiontype" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "employee_disciplinaryaction" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "employee_disciplinaryaction" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "employee_employeegeneralsetting" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "employee_employeegeneralsetting" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "employee_profileeditfeature" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "employee_profileeditfeature" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_surveytemplate" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_surveytemplate" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_skill" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_skill" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_recruitment" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_recruitment" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_historicalstage" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_stage" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_stage" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_historicalcandidate" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_candidate" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_candidate" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_rejectreason" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_rejectreason" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_historicalrejectedcandidate" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_rejectedcandidate" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_rejectedcandidate" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_stagefiles" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_stagefiles" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_stagenote" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_stagenote" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_recruitmentsurvey" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_recruitmentsurvey" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_questionordering" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_questionordering" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_recruitmentsurveyanswer" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_recruitmentsurveyanswer" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_skillzone" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_skillzone" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_skillzonecandidate" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_skillzonecandidate" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_candidaterating" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_candidaterating" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_recruitmentgeneralsetting" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_recruitmentgeneralsetting" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_interviewschedule" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_interviewschedule" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_candidatedocumentrequest" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_candidatedocumentrequest" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_candidatedocument" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_candidatedocument" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_linkedinaccount" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "recruitment_linkedinaccount" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_leavetypecondition" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_leavetypecondition" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_leavetype" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_leavetype" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_historicalavailableleave" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_availableleave" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_availableleave" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_historicalleaverequest" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_leaverequest" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_leaverequestcomment" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_leaverequestcomment" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_historicalleaveallocationrequest" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_leaveallocationrequest" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_leaveallocationrequest" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_leaveallocationrequestcomment" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_leaveallocationrequestcomment" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_restrictleave" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_restrictleave" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_historicalcompensatoryleaverequest" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_compensatoryleaverequest" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_compensatoryleaverequest" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_leavegeneralsetting" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_leavegeneralsetting" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_compensatoryleaverequestcomment" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_compensatoryleaverequestcomment" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_employeepastleaverestrict" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "leave_employeepastleaverestrict" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_period" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_period" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_historicalkeyresult" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_keyresult" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_keyresult" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_historicalobjective" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_objective" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_objective" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_historicalemployeeobjective" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_employeeobjective" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_employeeobjective" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_historicalcomment" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_historicalemployeekeyresult" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_questiontemplate" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_questiontemplate" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_question" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_question" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_questionoptions" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_questionoptions" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_feedback" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_feedback" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_meetings" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_meetings" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_employeebonuspoint" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "pms_employeebonuspoint" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "onboarding_onboardingstage" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "onboarding_onboardingstage" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "onboarding_onboardingtask" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "onboarding_onboardingtask" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "onboarding_candidatestage" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "onboarding_candidatestage" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "onboarding_historicalcandidatetask" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "onboarding_candidatetask" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "onboarding_candidatetask" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "onboarding_onboardingportal" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "onboarding_onboardingportal" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_assetcategory" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_assetcategory" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_assetgeneralsetting" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_assetgeneralsetting" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_assetlot" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_assetlot" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_asset" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_asset" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_assetitem" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_assetitem" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_assetreport" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_assetreport" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_assetdocuments" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_assetdocuments" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_returnimages" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_returnimages" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_assetassignment" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_assetassignment" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_assetrequest" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_assetrequest" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_assetrequestcomment" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_assetrequestcomment" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_assetservicerequest" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_assetservicerequest" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_assetservicerequestnote" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "asset_assetservicerequestnote" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_historicalattendanceactivity" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_attendanceactivity" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_attendanceactivity" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_batchattendance" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_batchattendance" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_historicalattendance" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_attendance" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_attendance" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_attendancerequestfile" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_attendancerequestfile" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_attendancerequestcomment" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_attendancerequestcomment" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_attendanceovertime" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_attendanceovertime" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_attendancelatecomeearlyout" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_attendancelatecomeearlyout" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_attendancevalidationcondition" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_attendancevalidationcondition" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_gracetime" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_gracetime" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_attendancegeneralsetting" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_attendancegeneralsetting" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_attendanceconflictresolution" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_attendanceconflictresolution" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_attendancesummaryhours" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_attendancesummaryhours" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_attendancedailyhours" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "attendance_attendancedailyhours" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "payroll_filingstatus" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "payroll_filingstatus" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "payroll_historicalcontract" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "payroll_contract" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "payroll_contract" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "payroll_allowance" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "payroll_allowance" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "payroll_deduction" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "payroll_deduction" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "payroll_salarystructure" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "payroll_salarystructure" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "payroll_historicalpayslip" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "payroll_payslip" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "payroll_payslip" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "payroll_loanaccount" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "payroll_loanaccount" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "payroll_reimbursement" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "payroll_reimbursement" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "payroll_reimbursementrequestcomment" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "payroll_reimbursementrequestcomment" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "payroll_payrollsettings" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "payroll_payrollsettings" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "payroll_taxbracket" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "payroll_taxbracket" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "accessibility_defaultaccessibility" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "accessibility_defaultaccessibility" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_audit_historytrackingfields" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_audit_historytrackingfields" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_audit_accountblockunblock" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_audit_accountblockunblock" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_audit_auditmodelconfig" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_audit_auditmodelconfig" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_documents_documentrequest" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_documents_documentrequest" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_documents_document" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_documents_document" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_views_togglecolumn" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_views_togglecolumn" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
DELETE FROM "horilla_views_togglecolumn" WHERE "user_id_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_views_activetab" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_views_activetab" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_views_activegroup" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_views_activegroup" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_views_savedfilter" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_views_savedfilter" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_views_activeview" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_views_activeview" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_views_columnorder" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_views_columnorder" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_automations_mailautomation" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_automations_mailautomation" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "biometric_biometricdevices" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "biometric_biometricdevices" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "helpdesk_departmentmanager" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "helpdesk_departmentmanager" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "helpdesk_tickettype" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "helpdesk_tickettype" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "helpdesk_historicalticket" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "helpdesk_ticket" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "helpdesk_ticket" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "helpdesk_claimrequest" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "helpdesk_claimrequest" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "helpdesk_comment" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "helpdesk_comment" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "helpdesk_attachment" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "helpdesk_attachment" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "helpdesk_faqcategory" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "helpdesk_faqcategory" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "helpdesk_faq" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "helpdesk_faq" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "offboarding_offboarding" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "offboarding_offboarding" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "offboarding_offboardingstage" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "offboarding_offboardingstage" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "offboarding_offboardingstagemultiplefile" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "offboarding_offboardingstagemultiplefile" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "offboarding_offboardingemployee" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "offboarding_offboardingemployee" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "offboarding_historicalresignationletter" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "offboarding_resignationletter" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "offboarding_resignationletter" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "offboarding_offboardingtask" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "offboarding_offboardingtask" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "offboarding_historicalemployeetask" SET "history_user_id" = NULL WHERE "history_user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "offboarding_employeetask" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "offboarding_employeetask" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "offboarding_exitreason" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "offboarding_exitreason" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "offboarding_offboardingnote" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "offboarding_offboardingnote" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "offboarding_offboardinggeneralsetting" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "offboarding_offboardinggeneralsetting" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "project_project" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "project_project" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "project_projectstage" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "project_projectstage" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "project_task" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "project_task" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "project_timesheet" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "project_timesheet" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_meet_googlecredential" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_meet_googlecredential" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_meet_googlemeeting" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_meet_googlemeeting" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "report_reporttemplate" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "report_reporttemplate" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "report_reportsubscription" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "report_reportsubscription" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "report_reportsubscription" SET "owner_id" = NULL WHERE "owner_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "report_reportfavorite" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "report_reportfavorite" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
DELETE FROM "report_reportfavorite" WHERE "user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "report_reportsavedview" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "report_reportsavedview" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
DELETE FROM "report_reportsavedview" WHERE "owner_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "report_reportfilterpreset" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "report_reportfilterpreset" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
DELETE FROM "report_reportfilterpreset" WHERE "user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "report_reportrunlog" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "report_reportrunlog" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "report_reportrunlog" SET "user_id" = NULL WHERE "user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "report_reportaccess" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "report_reportaccess" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "whatsapp_whatsappcredientials" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "whatsapp_whatsappcredientials" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_dbtemplate_template" SET "locked_by_id" = NULL WHERE "locked_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_dbtemplate_template" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_dbtemplate_template" SET "updated_by_id" = NULL WHERE "updated_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_dbtemplate_templateversion" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_tour_tour" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_tour_tour" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_tour_tourstep" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_tour_tourstep" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_tour_tourprogress" SET "created_by_id" = NULL WHERE "created_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
UPDATE "horilla_tour_tourprogress" SET "modified_by_id" = NULL WHERE "modified_by_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
DELETE FROM "horilla_tour_tourprogress" WHERE "user_id" IN (SELECT "id" FROM "horilla_auth_horillauser" WHERE NOT is_superuser);
DELETE FROM "horilla_auth_horillauser" WHERE NOT is_superuser;

-- history (simple_history) rows whose source record is gone
DELETE FROM "base_historicalrotatingworktypeassign" h WHERE NOT EXISTS (SELECT 1 FROM "base_rotatingworktypeassign" t WHERE t."id" = h."id");
DELETE FROM "base_historicalrotatingshiftassign" h WHERE NOT EXISTS (SELECT 1 FROM "base_rotatingshiftassign" t WHERE t."id" = h."id");
DELETE FROM "base_historicalworktyperequest" h WHERE NOT EXISTS (SELECT 1 FROM "base_worktyperequest" t WHERE t."id" = h."id");
DELETE FROM "base_historicalshiftrequest" h WHERE NOT EXISTS (SELECT 1 FROM "base_shiftrequest" t WHERE t."id" = h."id");
DELETE FROM "employee_historicalemployeeworkinformation" h WHERE NOT EXISTS (SELECT 1 FROM "employee_employeeworkinformation" t WHERE t."id" = h."id");
DELETE FROM "employee_historicalbonuspoint" h WHERE NOT EXISTS (SELECT 1 FROM "employee_bonuspoint" t WHERE t."id" = h."id");
DELETE FROM "recruitment_historicalstage" h WHERE NOT EXISTS (SELECT 1 FROM "recruitment_stage" t WHERE t."id" = h."id");
DELETE FROM "recruitment_historicalcandidate" h WHERE NOT EXISTS (SELECT 1 FROM "recruitment_candidate" t WHERE t."id" = h."id");
DELETE FROM "recruitment_historicalrejectedcandidate" h WHERE NOT EXISTS (SELECT 1 FROM "recruitment_rejectedcandidate" t WHERE t."id" = h."id");
DELETE FROM "leave_historicalavailableleave" h WHERE NOT EXISTS (SELECT 1 FROM "leave_availableleave" t WHERE t."id" = h."id");
DELETE FROM "leave_historicalleaverequest" h WHERE NOT EXISTS (SELECT 1 FROM "leave_leaverequest" t WHERE t."id" = h."id");
DELETE FROM "leave_historicalleaveallocationrequest" h WHERE NOT EXISTS (SELECT 1 FROM "leave_leaveallocationrequest" t WHERE t."id" = h."id");
DELETE FROM "leave_historicalcompensatoryleaverequest" h WHERE NOT EXISTS (SELECT 1 FROM "leave_compensatoryleaverequest" t WHERE t."id" = h."id");
DELETE FROM "pms_historicalkeyresult" h WHERE NOT EXISTS (SELECT 1 FROM "pms_keyresult" t WHERE t."id" = h."id");
DELETE FROM "pms_historicalobjective" h WHERE NOT EXISTS (SELECT 1 FROM "pms_objective" t WHERE t."id" = h."id");
DELETE FROM "pms_historicalemployeeobjective" h WHERE NOT EXISTS (SELECT 1 FROM "pms_employeeobjective" t WHERE t."id" = h."id");
DELETE FROM "pms_historicalcomment" h WHERE NOT EXISTS (SELECT 1 FROM "pms_comment" t WHERE t."id" = h."id");
DELETE FROM "pms_historicalemployeekeyresult" h WHERE NOT EXISTS (SELECT 1 FROM "pms_employeekeyresult" t WHERE t."id" = h."id");
DELETE FROM "onboarding_historicalcandidatetask" h WHERE NOT EXISTS (SELECT 1 FROM "onboarding_candidatetask" t WHERE t."id" = h."id");
DELETE FROM "attendance_historicalattendanceactivity" h WHERE NOT EXISTS (SELECT 1 FROM "attendance_attendanceactivity" t WHERE t."id" = h."id");
DELETE FROM "attendance_historicalattendance" h WHERE NOT EXISTS (SELECT 1 FROM "attendance_attendance" t WHERE t."id" = h."id");
DELETE FROM "payroll_historicalcontract" h WHERE NOT EXISTS (SELECT 1 FROM "payroll_contract" t WHERE t."id" = h."id");
DELETE FROM "payroll_historicalpayslip" h WHERE NOT EXISTS (SELECT 1 FROM "payroll_payslip" t WHERE t."id" = h."id");
DELETE FROM "helpdesk_historicalticket" h WHERE NOT EXISTS (SELECT 1 FROM "helpdesk_ticket" t WHERE t."id" = h."id");
DELETE FROM "offboarding_historicalresignationletter" h WHERE NOT EXISTS (SELECT 1 FROM "offboarding_resignationletter" t WHERE t."id" = h."id");
DELETE FROM "offboarding_historicalemployeetask" h WHERE NOT EXISTS (SELECT 1 FROM "offboarding_employeetask" t WHERE t."id" = h."id");

-- auditlog rows whose object is gone
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='pms' AND model='comment') AND object_pk NOT IN (SELECT "id"::text FROM "pms_comment");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='recruitment' AND model='recruitment') AND object_pk NOT IN (SELECT "id"::text FROM "recruitment_recruitment");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='base' AND model='announcement') AND object_pk NOT IN (SELECT "id"::text FROM "base_announcement");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='attendance' AND model='attendancerequestcomment') AND object_pk NOT IN (SELECT "id"::text FROM "attendance_attendancerequestcomment");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='asset' AND model='assetrequest') AND object_pk NOT IN (SELECT "id"::text FROM "asset_assetrequest");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='recruitment' AND model='candidate') AND object_pk NOT IN (SELECT "id"::text FROM "recruitment_candidate");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='leave' AND model='leaveallocationrequestcomment') AND object_pk NOT IN (SELECT "id"::text FROM "leave_leaveallocationrequestcomment");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='leave' AND model='employeepastleaverestrict') AND object_pk NOT IN (SELECT "id"::text FROM "leave_employeepastleaverestrict");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='helpdesk' AND model='faq') AND object_pk NOT IN (SELECT "id"::text FROM "helpdesk_faq");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='recruitment' AND model='candidatedocument') AND object_pk NOT IN (SELECT "id"::text FROM "recruitment_candidatedocument");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='base' AND model='penaltyaccounts') AND object_pk NOT IN (SELECT "id"::text FROM "base_penaltyaccounts");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='pms' AND model='answer') AND object_pk NOT IN (SELECT "id"::text FROM "pms_answer");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='base' AND model='announcementcomment') AND object_pk NOT IN (SELECT "id"::text FROM "base_announcementcomment");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='employee' AND model='bonuspoint') AND object_pk NOT IN (SELECT "id"::text FROM "employee_bonuspoint");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='helpdesk' AND model='comment') AND object_pk NOT IN (SELECT "id"::text FROM "helpdesk_comment");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='recruitment' AND model='resume') AND object_pk NOT IN (SELECT "id"::text FROM "recruitment_resume");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='base' AND model='attachment') AND object_pk NOT IN (SELECT "id"::text FROM "base_attachment");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='onboarding' AND model='candidatetask') AND object_pk NOT IN (SELECT "id"::text FROM "onboarding_candidatetask");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='base' AND model='shiftrequestcomment') AND object_pk NOT IN (SELECT "id"::text FROM "base_shiftrequestcomment");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='recruitment' AND model='skillzonecandidate') AND object_pk NOT IN (SELECT "id"::text FROM "recruitment_skillzonecandidate");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='payroll' AND model='reimbursementrequestcomment') AND object_pk NOT IN (SELECT "id"::text FROM "payroll_reimbursementrequestcomment");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='base' AND model='shiftrequest') AND object_pk NOT IN (SELECT "id"::text FROM "base_shiftrequest");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='pms' AND model='meetings') AND object_pk NOT IN (SELECT "id"::text FROM "pms_meetings");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='recruitment' AND model='stagenote') AND object_pk NOT IN (SELECT "id"::text FROM "recruitment_stagenote");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='payroll' AND model='reimbursement') AND object_pk NOT IN (SELECT "id"::text FROM "payroll_reimbursement");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='recruitment' AND model='candidatedocumentrequest') AND object_pk NOT IN (SELECT "id"::text FROM "recruitment_candidatedocumentrequest");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='asset' AND model='assetservicerequest') AND object_pk NOT IN (SELECT "id"::text FROM "asset_assetservicerequest");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='asset' AND model='assetreport') AND object_pk NOT IN (SELECT "id"::text FROM "asset_assetreport");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='leave' AND model='leaveallocationrequest') AND object_pk NOT IN (SELECT "id"::text FROM "leave_leaveallocationrequest");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='leave' AND model='leaverequestcomment') AND object_pk NOT IN (SELECT "id"::text FROM "leave_leaverequestcomment");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='helpdesk' AND model='faqcategory') AND object_pk NOT IN (SELECT "id"::text FROM "helpdesk_faqcategory");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='helpdesk' AND model='claimrequest') AND object_pk NOT IN (SELECT "id"::text FROM "helpdesk_claimrequest");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='project' AND model='task') AND object_pk NOT IN (SELECT "id"::text FROM "project_task");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='project' AND model='projectstage') AND object_pk NOT IN (SELECT "id"::text FROM "project_projectstage");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='horilla_documents' AND model='document') AND object_pk NOT IN (SELECT "id"::text FROM "horilla_documents_document");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='asset' AND model='assetdocuments') AND object_pk NOT IN (SELECT "id"::text FROM "asset_assetdocuments");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='attendance' AND model='batchattendance') AND object_pk NOT IN (SELECT "id"::text FROM "attendance_batchattendance");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='payroll' AND model='payslip') AND object_pk NOT IN (SELECT "id"::text FROM "payroll_payslip");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='recruitment' AND model='stage') AND object_pk NOT IN (SELECT "id"::text FROM "recruitment_stage");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='horilla_documents' AND model='documentrequest') AND object_pk NOT IN (SELECT "id"::text FROM "horilla_documents_documentrequest");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='pms' AND model='objective') AND object_pk NOT IN (SELECT "id"::text FROM "pms_objective");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='project' AND model='project') AND object_pk NOT IN (SELECT "id"::text FROM "project_project");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='leave' AND model='leaverequest') AND object_pk NOT IN (SELECT "id"::text FROM "leave_leaverequest");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='attendance' AND model='attendancedailyhours') AND object_pk NOT IN (SELECT "id"::text FROM "attendance_attendancedailyhours");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='payroll' AND model='loanaccount') AND object_pk NOT IN (SELECT "id"::text FROM "payroll_loanaccount");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='leave' AND model='leaverequestfile') AND object_pk NOT IN (SELECT "id"::text FROM "leave_leaverequestfile");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='base' AND model='emaillog') AND object_pk NOT IN (SELECT "id"::text FROM "base_emaillog");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='attendance' AND model='attendancerequestfile') AND object_pk NOT IN (SELECT "id"::text FROM "attendance_attendancerequestfile");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='horilla_auth' AND model='horillauser') AND object_pk NOT IN (SELECT "id"::text FROM "horilla_auth_horillauser");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='leave' AND model='leaverequestconditionapproval') AND object_pk NOT IN (SELECT "id"::text FROM "leave_leaverequestconditionapproval");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='offboarding' AND model='offboardingnote') AND object_pk NOT IN (SELECT "id"::text FROM "offboarding_offboardingnote");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='pms' AND model='meetingsanswer') AND object_pk NOT IN (SELECT "id"::text FROM "pms_meetingsanswer");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='base' AND model='rotatingworktypeassign') AND object_pk NOT IN (SELECT "id"::text FROM "base_rotatingworktypeassign");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='offboarding' AND model='resignationletter') AND object_pk NOT IN (SELECT "id"::text FROM "offboarding_resignationletter");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='attendance' AND model='attendanceconflictresolution') AND object_pk NOT IN (SELECT "id"::text FROM "attendance_attendanceconflictresolution");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='base' AND model='worktyperequest') AND object_pk NOT IN (SELECT "id"::text FROM "base_worktyperequest");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='asset' AND model='assetassignment') AND object_pk NOT IN (SELECT "id"::text FROM "asset_assetassignment");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='base' AND model='baserequestfile') AND object_pk NOT IN (SELECT "id"::text FROM "base_baserequestfile");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='leave' AND model='availableleave') AND object_pk NOT IN (SELECT "id"::text FROM "leave_availableleave");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='base' AND model='rotatingshiftassign') AND object_pk NOT IN (SELECT "id"::text FROM "base_rotatingshiftassign");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='pms' AND model='anonymousfeedback') AND object_pk NOT IN (SELECT "id"::text FROM "pms_anonymousfeedback");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='payroll' AND model='workrecord') AND object_pk NOT IN (SELECT "id"::text FROM "payroll_workrecord");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='attendance' AND model='attendanceactivity') AND object_pk NOT IN (SELECT "id"::text FROM "attendance_attendanceactivity");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='payroll' AND model='contract') AND object_pk NOT IN (SELECT "id"::text FROM "payroll_contract");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='onboarding' AND model='candidatestage') AND object_pk NOT IN (SELECT "id"::text FROM "onboarding_candidatestage");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='helpdesk' AND model='attachment') AND object_pk NOT IN (SELECT "id"::text FROM "helpdesk_attachment");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='attendance' AND model='attendanceovertime') AND object_pk NOT IN (SELECT "id"::text FROM "attendance_attendanceovertime");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='employee' AND model='disciplinaryaction') AND object_pk NOT IN (SELECT "id"::text FROM "employee_disciplinaryaction");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='pms' AND model='employeeobjective') AND object_pk NOT IN (SELECT "id"::text FROM "pms_employeeobjective");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='asset' AND model='assetservicerequestnote') AND object_pk NOT IN (SELECT "id"::text FROM "asset_assetservicerequestnote");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='employee' AND model='notefiles') AND object_pk NOT IN (SELECT "id"::text FROM "employee_notefiles");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='base' AND model='announcementview') AND object_pk NOT IN (SELECT "id"::text FROM "base_announcementview");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='pms' AND model='keyresultfeedback') AND object_pk NOT IN (SELECT "id"::text FROM "pms_keyresultfeedback");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='recruitment' AND model='rejectedcandidate') AND object_pk NOT IN (SELECT "id"::text FROM "recruitment_rejectedcandidate");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='pms' AND model='employeekeyresult') AND object_pk NOT IN (SELECT "id"::text FROM "pms_employeekeyresult");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='asset' AND model='asset') AND object_pk NOT IN (SELECT "id"::text FROM "asset_asset");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='asset' AND model='returnimages') AND object_pk NOT IN (SELECT "id"::text FROM "asset_returnimages");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='employee' AND model='employee') AND object_pk NOT IN (SELECT "id"::text FROM "employee_employee");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='recruitment' AND model='interviewschedule') AND object_pk NOT IN (SELECT "id"::text FROM "recruitment_interviewschedule");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='payroll' AND model='reimbursementmultipleattachment') AND object_pk NOT IN (SELECT "id"::text FROM "payroll_reimbursementmultipleattachment");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='employee' AND model='employeenote') AND object_pk NOT IN (SELECT "id"::text FROM "employee_employeenote");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='attendance' AND model='attendancelatecomeearlyout') AND object_pk NOT IN (SELECT "id"::text FROM "attendance_attendancelatecomeearlyout");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='onboarding' AND model='onboardingportal') AND object_pk NOT IN (SELECT "id"::text FROM "onboarding_onboardingportal");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='recruitment' AND model='recruitmentsurveyanswer') AND object_pk NOT IN (SELECT "id"::text FROM "recruitment_recruitmentsurveyanswer");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='attendance' AND model='workrecords') AND object_pk NOT IN (SELECT "id"::text FROM "attendance_workrecords");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='asset' AND model='assetrequestcomment') AND object_pk NOT IN (SELECT "id"::text FROM "asset_assetrequestcomment");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='asset' AND model='assetlot') AND object_pk NOT IN (SELECT "id"::text FROM "asset_assetlot");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='base' AND model='roster') AND object_pk NOT IN (SELECT "id"::text FROM "base_roster");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='offboarding' AND model='offboardingemployee') AND object_pk NOT IN (SELECT "id"::text FROM "offboarding_offboardingemployee");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='base' AND model='worktyperequestcomment') AND object_pk NOT IN (SELECT "id"::text FROM "base_worktyperequestcomment");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='base' AND model='rosterpublishlog') AND object_pk NOT IN (SELECT "id"::text FROM "base_rosterpublishlog");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='pms' AND model='feedback') AND object_pk NOT IN (SELECT "id"::text FROM "pms_feedback");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='helpdesk' AND model='ticket') AND object_pk NOT IN (SELECT "id"::text FROM "helpdesk_ticket");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='attendance' AND model='attendancesummaryhours') AND object_pk NOT IN (SELECT "id"::text FROM "attendance_attendancesummaryhours");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='project' AND model='timesheet') AND object_pk NOT IN (SELECT "id"::text FROM "project_timesheet");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='payroll' AND model='reimbursementfile') AND object_pk NOT IN (SELECT "id"::text FROM "payroll_reimbursementfile");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='attendance' AND model='attendance') AND object_pk NOT IN (SELECT "id"::text FROM "attendance_attendance");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='recruitment' AND model='candidaterating') AND object_pk NOT IN (SELECT "id"::text FROM "recruitment_candidaterating");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='recruitment' AND model='stagefiles') AND object_pk NOT IN (SELECT "id"::text FROM "recruitment_stagefiles");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='asset' AND model='assetitem') AND object_pk NOT IN (SELECT "id"::text FROM "asset_assetitem");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='pms' AND model='employeebonuspoint') AND object_pk NOT IN (SELECT "id"::text FROM "pms_employeebonuspoint");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='offboarding' AND model='employeetask') AND object_pk NOT IN (SELECT "id"::text FROM "offboarding_employeetask");
DELETE FROM auditlog_logentry WHERE content_type_id = (SELECT id FROM django_content_type WHERE app_label='base' AND model='driverviewed') AND object_pk NOT IN (SELECT "id"::text FROM "base_driverviewed");

-- Review counts, then COMMIT; (or ROLLBACK;)
