@echo off

setlocal

set SERVER="PCCU-ONYX-DEV-l,59730"
set DB=devCCMv7_01
set USER=OnyxDBO
set PWD=onyx

echo SERVER %SERVER%
echo DB     %DB%
echo USER   %USER%
echo PWD    %PWD%

rem Drop all foreign keys
echo IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\drop_foreign_keys.bat %SERVER% %DB% %USER% %PWD% 
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\drop_foreign_keys.bat %SERVER% %DB% %USER% %PWD% 

rem Truncate all tables that are to be fully loaded
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% contact_type
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% contact_type_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% country
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% country_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% incident_category
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% incident_category_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% incident_product
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% incident_product_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% language
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% language_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% nat_lang_config
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% nat_lang_category
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% nat_lang_category_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% national_language
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% oed_object_map
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% onyx_resource
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% onyx_resource_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% profile
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% profile_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% profile_role
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% reference_field_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% reference_field
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% reference_lookup
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% reference_parameter
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% reference_parameter_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% role
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% role_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% role_resource
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% system_parameter
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% system_parameter_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% table_administration_item
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% table_administration_item_ml

rem Merge Template Tables
rem Merge Templates excluded from domain data 01MAY13
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% merge_template
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% merge_template_group
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% merge_template_group_ml

rem Users and groups
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% user_group
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% user_group_ml
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% users

rem Surveys
rem Surveys excluded from domain data due to Portrait Survey Integration  01MAY13
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% survey_type
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% survey_type_ml
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% survey
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% survey_ml
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% survey_question
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% question
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% question_ml
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% question_hierarchy
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% question_response
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% response
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% response_ml

rem Product
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% product_group
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% product_group_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% product
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% product_ml

rem Literature
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% literature_product
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% lit_prod_fulfill_type_assoc

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% literature_service_printer
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% literature_service_printer_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fulfillment_engine
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fulfillment_engine_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fulfillment_type
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fulfillment_type_ml

rem Campaigns
rem Campaigns not domain data, to be restored from production NF 24/08/2010
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% campaign
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% campaign_ml
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% milestone_action
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% milestone_action_ml
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% milestone_category
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% milestone_category_ml
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% tracking_code
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% tracking_code_milestone
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% tracking_code_ml
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% tracking_code_type
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% tracking_code_type_ml

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_auto_form_config
rem Branch Printers not domain data, to be restored from production as advised by IW 25/07/2012
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_branch_printer
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_incident_survey_default
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_product_snapshot
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_quick_incident_default
rem Outage Schedule not domain data, to be restored from production NF 15/09/2010
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_outage_schedule
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_event_product_category
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_signature_customer_map
rem Post Code Table Removed - 16MAY17
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_australia_postcode_data
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_treatment_plan_rules
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_signature_fee
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_treatment_category

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% action_batch_status
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% action_batch_status_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% currency
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% currency_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% order_line_status
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% order_line_status_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% region
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% region_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% relative_date
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% relative_date_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% search_operator
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% search_operator_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% search_result_default
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% search_table
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% search_table_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% search_view
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% search_view_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% search_view_detail
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% search_view_detail_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% literature_ship_via
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% literature_ship_via_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% task_category
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% task_category_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% template
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% template_ml

rem Forms Workflow tables
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fw_process_dataset
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fw_process_dataset_method
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fw_process_dataset_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fw_process_defn
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fw_process_defn_dataset
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fw_process_defn_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fw_process_form
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fw_process_form_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fw_process_group
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fw_process_group_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fw_process_step_config
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fw_process_step_config_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fw_process_step_defn
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fw_process_step_defn_dataset
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fw_process_step_defn_method
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fw_process_step_defn_method_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fw_process_step_defn_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fw_process_transition
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fw_process_transition_condition
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fw_process_transition_condition_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fw_process_transition_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% fw_process_transition_step

rem Assignment Studio Tables
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% assignment_condition
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% assignment_condition_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% assignment_expression
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% assignment_set
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% assignment_set_condition
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% assignment_set_extension
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% assignment_set_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% assignment_set_user
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% assignment_territory
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% assignment_territory_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% method_call
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% method_call_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% method_call_detail
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% method_call_detail_ml

rem Social Media Type 
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% social_network_type
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% social_network_type_ml

rem Audit Logs
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_generic_audit
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_generic_audit_column

rem Mutual Aid Tables
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_mutual_aid_schedule
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_mutual_aid_schedule_detail
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_mutual_aid_test_case

rem Card Processing Tables
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_card_type
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_card_iin
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_card_type_account_rule
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_card_status_change

rem Product Swap Tables
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_product
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_product_swap
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_product_swap_map

rem Daylight Saving Table
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_dst_south_australia

rem Credit Application Tables
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_product_credit
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_product_margin
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_product_credit_fee
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_product_credit_fee_map
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_product_credit_rate
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_product_credit_rate_map
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_product_credit_purpose
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_product_group
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_product_group_credit_purpose_map

rem Archive Data Table
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat %SERVER% %DB% %USER% %PWD% ct_archive_data

rem Credit Management Table

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat  %SERVER% %DB% %USER% %PWD% ct_sms_data_template
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat  %SERVER% %DB% %USER% %PWD% ct_sms_content_group
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat  %SERVER% %DB% %USER% %PWD% ct_sms_content_template
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat  %SERVER% %DB% %USER% %PWD% ct_sms_recipient_origin
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat  %SERVER% %DB% %USER% %PWD% ct_sms_date_exclusion_schedule
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat  %SERVER% %DB% %USER% %PWD% ct_credit_management_dialler_result
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\truncate_table.bat  %SERVER% %DB% %USER% %PWD% ct_credit_management_contact

rem Delete data from tables that are to be partially loaded
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\execute_query.bat %SERVER% %DB% %USER% %PWD% "delete from %DB%..user_preference where user_id='default'"
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\execute_query.bat %SERVER% %DB% %USER% %PWD% "delete from %DB%..users where group_code='DBA'"


rem Load data into tables
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% contact_type
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% contact_type_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% country
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% country_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% incident_category
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% incident_category_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% incident_product
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% incident_product_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% language
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% language_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% nat_lang_config
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% nat_lang_category
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% nat_lang_category_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% national_language
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% oed_object_map
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% onyx_resource
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% onyx_resource_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% profile
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% profile_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% profile_role
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% reference_field
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% reference_field_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% reference_lookup
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% reference_parameter
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% reference_parameter_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% role
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% role_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% role_resource
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% system_parameter
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% system_parameter_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% table_administration_item
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% table_administration_item_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% user_preference

rem Merge Template Tables
rem Merge Templates excluded from domain data 01MAY13
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% merge_template
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% merge_template_group
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% merge_template_group_ml

rem Reseed the tables
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\reseed_table.bat %SERVER% %DB% %USER% %PWD% sec_id_merge_template merge_template

rem Users and groups
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% user_group
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% user_group_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% users

rem Surveys
rem Surveys excluded from domain data due to Portrait Survey Integration  01MAY13
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% survey_type
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% survey_type_ml
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% survey
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% survey_ml
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% survey_question
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% question
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% question_ml
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% question_hierarchy
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% question_response
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% response
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% response_ml

rem Product
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% product_group
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% product_group_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% product
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% product_ml

rem Literature
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% literature_product
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% lit_prod_fulfill_type_assoc

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% literature_service_printer
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% literature_service_printer_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fulfillment_engine
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fulfillment_engine_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fulfillment_type
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fulfillment_type_ml

rem Campaigns
rem Campaigns not domain data, to be restored from production NF 24/08/2010
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% campaign
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% campaign_ml
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% milestone_action
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% milestone_action_ml
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% milestone_category
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% milestone_category_ml
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% tracking_code
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% tracking_code_milestone
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% tracking_code_ml
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% tracking_code_type
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% tracking_code_type_ml

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_auto_form_config
rem Branch Printers not domain data, to be restored from production as advised by IW 25/07/2012
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_branch_printer
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_incident_survey_default
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_product_snapshot
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_quick_incident_default
rem Outage Schedule not domain data, to be restored from production NF 15/09/2010
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_outage_schedule
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_event_product_category
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_signature_customer_map
rem Post Code Table Removed - 16MAY17
rem IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_australia_postcode_data
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_treatment_plan_rules
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_signature_fee
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_treatment_category

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% action_batch_status
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% action_batch_status_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% currency
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% currency_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% order_line_status
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% order_line_status_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% region
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% region_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% relative_date
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% relative_date_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% search_operator
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% search_operator_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% search_result_default
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% search_table
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% search_table_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% search_view
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% search_view_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% search_view_detail
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% search_view_detail_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% literature_ship_via
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% literature_ship_via_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% task_category
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% task_category_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% template
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% template_ml

rem Forms Workflow tables
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fw_process_dataset
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fw_process_dataset_method
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fw_process_dataset_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fw_process_defn
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fw_process_defn_dataset
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fw_process_defn_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fw_process_form
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fw_process_form_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fw_process_group
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fw_process_group_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fw_process_step_config
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fw_process_step_config_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fw_process_step_defn
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fw_process_step_defn_dataset
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fw_process_step_defn_method
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fw_process_step_defn_method_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fw_process_step_defn_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fw_process_transition
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fw_process_transition_condition
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fw_process_transition_condition_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fw_process_transition_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% fw_process_transition_step

rem Assignment Studio Tables
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% assignment_condition
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% assignment_condition_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% assignment_expression
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% assignment_set
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% assignment_set_condition
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% assignment_set_extension
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% assignment_set_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% assignment_set_user
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% assignment_territory
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% assignment_territory_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% method_call
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% method_call_ml
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% method_call_detail
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% method_call_detail_ml

rem Social Media Types
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% social_network_type
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% social_network_type_ml

rem Audit Logs
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_generic_audit
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_generic_audit_column

rem Mutual Aid Tables
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_mutual_aid_schedule
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_mutual_aid_schedule_detail
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_mutual_aid_test_case

rem Card Processing Tables
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_card_type
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_card_iin
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_card_type_account_rule
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_card_status_change

rem Product Swap Tables
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_product
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_product_swap
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_product_swap_map

rem Daylight Saving Table
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_dst_south_australia

rem Credit Application Tables
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_product_credit
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_product_margin
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_product_credit_fee
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_product_credit_fee_map
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_product_credit_rate
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_product_credit_rate_map
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_product_credit_purpose
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_product_group
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_product_group_credit_purpose_map

rem Archive Data Table
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_archive_data

rem Credit Management Table

IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_sms_data_template
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_sms_content_group
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_sms_content_template
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_sms_recipient_origin
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_sms_date_exclusion_schedule
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_credit_management_dialler_result
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\bcpin.bat %SERVER% %DB% %USER% %PWD% ct_credit_management_contact


echo ...
echo GRANDPARENT ERRORLEVEL is %ERRORLEVEL%
echo ...
rem Recreate all foreign keys
IF ERRORLEVEL 1 (goto ERROR_EXIT) else call BaseBatFiles\create_foreign_keys.bat %SERVER% %DB% %USER% %PWD%
echo ...
echo GRANDPARENT ERRORLEVEL is %ERRORLEVEL%
echo ...

IF ERRORLEVEL 1 (goto ERROR_EXIT)  

endlocal

pause
exit 0

:ERROR_EXIT
echo ERROR 
echo . 
echo Error experienced with last step. 
echo .
echo Error Level is %ERRORLEVEL%
echo Please investigate
pause
exit 1