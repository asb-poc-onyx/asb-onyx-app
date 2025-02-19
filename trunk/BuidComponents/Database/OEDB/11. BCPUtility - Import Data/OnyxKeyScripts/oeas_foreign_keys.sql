/*
**
**  Name: oeas_foreign_keys.sql
**
**  Copyright 1994-2010 Consona CRM Inc. All rights reserved.
**
**  Purpose:  
**
**  @Rm++
**  Revision History
**  -------------------------------------------------------------------------
**  Date        Name     Description
**  -------------------------------------------------------------------------
**  04/11/2003  Lynna    Initial creation from Washington sourcesafe on 04/11/2003
**  02/15/2005  GregP    Added Fiji
**  11/15/2005  PaddyH   Added Oaktree TM
**  11/22/2005  SteveW   Added Appointment Objects
**  12/05/2005  SteveSc  Added Olympia profile objects
**  01/11/2006  ScottH   Added Oaktree assignment set objects
**  01/25/2006  SteveSc  WT 91273, cascade delete ML table constraints
**  02/16/06    GregP    Added foreign key for profile on user_preference
**  02/17/2006  PaddyH   Added foreign keys for assignment_set_association.
**                       Modified existing keys for Oaktree TM iteration 3.
**  02/27/2006  KeithK   WT 91326 - added some mssing FK's
**  02/27/2006  KeithK   WT 91521 - added FK on task.duration_units
**  04/10/2006  SteveSc  wt 90679 cascade deletes on many foreign keys
**  04/11/2006  SteveSc  wt 90679 remove cascade from fk_user_group_users
**  05/18/2006  RobC     WT 93637 - removed match_code table.
**  06/08/2006  SteveSc  93390: Changed profile_did to profile_code + data type change
**  07/05/2006  KeithK   94800: made fk_user_preference_profile cascade the delete of 
**                       profile.
**  05/20/2010  Ashish.k 97806: made fk_external_user_language  on external user
**  01/20/2011	AlbertP	 Added Social Network Integration object keys
**  01/20/2011	Alok	 Added FK for email_address table
**  @Rm--
*/


ALTER TABLE batch_source_list_status
    ADD CONSTRAINT fk_batch_src_action_batch_id
    FOREIGN KEY (action_batch_id)
    REFERENCES action_batch (action_batch_id)
GO

ALTER TABLE action_batch
    ADD CONSTRAINT fk_action_batch_status_code
    FOREIGN KEY (action_batch_status_code, site_id)
    REFERENCES action_batch_status(action_batch_status_code,site_id)
GO

ALTER TABLE action_batch_status_ml
    ADD CONSTRAINT fk_action_batch_ml_status_code
    FOREIGN KEY (action_batch_status_code, site_id)
    REFERENCES action_batch_status(action_batch_status_code,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE campaign_ml
    ADD CONSTRAINT fk_campaign_ml
    FOREIGN KEY (campaign_code,site_id)
    REFERENCES campaign (campaign_code,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE tracking_code
    ADD CONSTRAINT fk_tracking_code_campaign
    FOREIGN KEY (campaign_code,site_id)
    REFERENCES campaign (campaign_code,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE company
    ADD CONSTRAINT fk_company_parent_company
    FOREIGN KEY (parent_company_id)
    REFERENCES company (company_id)
GO

ALTER TABLE individual
    ADD CONSTRAINT fk_individual_company
    FOREIGN KEY (company_id)
    REFERENCES company (company_id)
GO

ALTER TABLE partner 
    ADD CONSTRAINT fk_partner_company
    FOREIGN KEY (company_id)
    REFERENCES company (company_id)
GO

ALTER TABLE company
    ADD CONSTRAINT fk_company_company_family
    FOREIGN KEY (company_family_did,site_id)
    REFERENCES company_family (company_family_did,site_id)
GO

ALTER TABLE contact_category_ml
    ADD CONSTRAINT fk_contact_category_ml
    FOREIGN KEY (contact_category_did,site_id)
    REFERENCES contact_category (contact_category_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE contact_type
    ADD CONSTRAINT fk_contact_category_type
    FOREIGN KEY (contact_category_did,site_id)
    REFERENCES contact_category (contact_category_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE contact_type
    ADD CONSTRAINT fk_contact_group_type
    FOREIGN KEY (contact_group_type_did,site_id)
    REFERENCES contact_group_type (contact_group_type_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE contact_type  
	WITH CHECK ADD CONSTRAINT Fk_contact_type_reciprocal_company 
	FOREIGN KEY(reciprocal_company_did, site_id)
	REFERENCES contact_type (contact_type_did, site_id)
GO

ALTER TABLE contact_type
	WITH CHECK ADD CONSTRAINT FK_contact_type_reciprocal_individual 
	FOREIGN KEY(reciprocal_individual_did, site_id) 
	REFERENCES contact_type (contact_type_did, site_id)
GO

ALTER TABLE contact_group_type_ml
    ADD CONSTRAINT fk_contact_group_type_ml
    FOREIGN KEY (contact_group_type_did,site_id)
    REFERENCES contact_group_type (contact_group_type_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE external_contact
    ADD CONSTRAINT fk_external_contact_type
    FOREIGN KEY (contact_type_did,site_id)
    REFERENCES contact_type (contact_type_did,site_id)
GO

ALTER TABLE internal_contact
    ADD CONSTRAINT fk_internal_contact_type
    FOREIGN KEY (contact_type_did,site_id)
    REFERENCES contact_type (contact_type_did,site_id)
GO

ALTER TABLE contact_type_ml
    ADD CONSTRAINT fk_contact_type_ml
    FOREIGN KEY (contact_type_did,site_id)
    REFERENCES contact_type (contact_type_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE address
    ADD CONSTRAINT fk_address_country
    FOREIGN KEY (country_code,site_id)
    REFERENCES country (country_code,site_id)
GO

ALTER TABLE country_ml
    ADD CONSTRAINT fk_country_ml
    FOREIGN KEY (country_code,site_id)
    REFERENCES country (country_code,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE literature_order_header
    ADD CONSTRAINT fk_literature_header_country
    FOREIGN KEY (country_code,site_id)
    REFERENCES country (country_code,site_id)
GO

ALTER TABLE phone
    ADD CONSTRAINT fk_phone_country
    FOREIGN KEY (country_code,site_id)
    REFERENCES country (country_code,site_id)
GO

ALTER TABLE region
    ADD CONSTRAINT fk_region_country
    FOREIGN KEY (country_code,site_id)
    REFERENCES country (country_code,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE currency_ml
    ADD CONSTRAINT fk_currency_ml
    FOREIGN KEY (currency_code,site_id)
    REFERENCES currency (currency_code,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE currency_conversion
    ADD CONSTRAINT fk_currency_conversion_to
    FOREIGN KEY (currency_code_to,site_id)
    REFERENCES currency (currency_code,site_id)
GO

ALTER TABLE currency_conversion
    ADD CONSTRAINT fk_currency_conversion_from
    FOREIGN KEY (currency_code_from,site_id)
    REFERENCES currency (currency_code,site_id)
GO

ALTER TABLE currency_conversion
    ADD CONSTRAINT fk_currency_conversion_triang
    FOREIGN KEY (triangulation_code,site_id)
    REFERENCES currency (currency_code,site_id)
GO

ALTER TABLE forecast_header
    ADD CONSTRAINT fk_forecast_curr_primary
    FOREIGN KEY (primary_currency_code,site_id)
    REFERENCES currency (currency_code,site_id)
GO

ALTER TABLE forecast_header
    ADD CONSTRAINT fk_forecast_curr_secondary
    FOREIGN KEY (secondary_currency_code,site_id)
    REFERENCES currency (currency_code,site_id)
GO

ALTER TABLE product
    ADD CONSTRAINT fk_product_currency
    FOREIGN KEY (currency_code,site_id)
    REFERENCES currency (currency_code,site_id)
GO

ALTER TABLE quote_header
    ADD CONSTRAINT fk_quote_curr_primary
    FOREIGN KEY (primary_currency_code,site_id)
    REFERENCES currency (currency_code,site_id)
GO

ALTER TABLE quote_header
    ADD CONSTRAINT fk_quote_curr_secondary
    FOREIGN KEY (secondary_currency_code,site_id)
    REFERENCES currency (currency_code,site_id)
GO

ALTER TABLE template
    ADD CONSTRAINT fk_template_destination_app
    FOREIGN KEY (destination_app_code,site_id)
    REFERENCES destination_app (destination_app_code,site_id)
GO

ALTER TABLE file_link
ADD CONSTRAINT fk_file_link_file_loc_id
    FOREIGN KEY (file_location_did, site_id)
    REFERENCES file_location (file_location_did, site_id)
GO

ALTER TABLE forecast_detail
    ADD CONSTRAINT fk_forecast_detail_header
    FOREIGN KEY (forecast_header_id)
    REFERENCES forecast_header (forecast_header_id)
GO

ALTER TABLE fulfillment_type
    ADD CONSTRAINT fk_fulfillment_type_engine
    FOREIGN KEY (fulfillment_engine_did, site_id)
    REFERENCES fulfillment_engine(fulfillment_engine_did, site_id)
GO

ALTER TABLE fulfillment_engine_ml
    ADD CONSTRAINT fk_fulfillment_engine_ml
    FOREIGN KEY (fulfillment_engine_did, site_id)
    REFERENCES fulfillment_engine(fulfillment_engine_did, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE fulfillment_engine_ml
    ADD CONSTRAINT fk_fulfillment_engine_ml_language
    FOREIGN KEY ( language_code, site_id)
    REFERENCES language ( language_code, site_id)
GO

ALTER TABLE subsystem
    ADD CONSTRAINT fk_subsystem_fulfill_engine
    FOREIGN KEY (fulfillment_engine_did, site_id)
    REFERENCES fulfillment_engine(fulfillment_engine_did,site_id)
GO

ALTER TABLE fulfillment_type_ml
    ADD CONSTRAINT fk_fulfillment_type_ml
    FOREIGN KEY (fulfillment_type_code, site_id)
    REFERENCES fulfillment_type(fulfillment_type_code, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE literature_order_detail
    ADD CONSTRAINT fk_lit_order_det_fulfill_type
    FOREIGN KEY (fulfillment_type_code, site_id)
    REFERENCES fulfillment_type(fulfillment_type_code, site_id)
GO

ALTER TABLE lit_prod_fulfill_type_assoc
    ADD CONSTRAINT fk_lit_prod_fulfill_assoc_type
    FOREIGN KEY (fulfillment_type_code, site_id)
    REFERENCES fulfillment_type(fulfillment_type_code, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE system_document
    ADD CONSTRAINT fk_system_doc_fulfillment_type
    FOREIGN KEY (fulfillment_type_code, site_id)
    REFERENCES fulfillment_type(fulfillment_type_code, site_id)
GO

ALTER TABLE system_document
    ADD CONSTRAINT fk_sys_doc_lit_prod_fulfill
    FOREIGN KEY (literature_product_code, fulfillment_type_code, site_id)
    REFERENCES lit_prod_fulfill_type_assoc (literature_product_code, fulfillment_type_code, site_id)

GO

ALTER TABLE incident_audit_log
    ADD CONSTRAINT fk_incident_audit_log_incident
    FOREIGN KEY (incident_id)
    REFERENCES incident (incident_id)
GO

ALTER TABLE incident
    ADD CONSTRAINT fk_incident_incident_category
    FOREIGN KEY (incident_category_did,site_id)
    REFERENCES incident_category (incident_category_did,site_id)

GO

ALTER TABLE incident_category_ml
    ADD CONSTRAINT fk_incident_category_ml
    FOREIGN KEY (incident_category_did,site_id)
    REFERENCES incident_category (incident_category_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE incident_product
    ADD CONSTRAINT fk_incident_product_category
    FOREIGN KEY (incident_category_did,site_id)
    REFERENCES incident_category (incident_category_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE task_category
    ADD CONSTRAINT fk_task_category_incident
    FOREIGN KEY (incident_category_did,site_id)
    REFERENCES incident_category (incident_category_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE incident_product_ml
    ADD CONSTRAINT fk_incident_product_ml
    FOREIGN KEY (incident_product_code,incident_category_did,site_id)
    REFERENCES incident_product (incident_product_code,incident_category_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE incident
    ADD CONSTRAINT fk_incident_incident_product
    FOREIGN KEY (incident_product_code,incident_category_did,site_id)
    REFERENCES incident_product (incident_product_code,incident_category_did,site_id)
GO

ALTER TABLE company
    ADD CONSTRAINT fk_company_individual
    FOREIGN KEY (primary_contact_id)
    REFERENCES individual (individual_id)
GO

ALTER TABLE key_word_association
    ADD CONSTRAINT fk_key_word_association
    FOREIGN KEY (key_word_id)
    REFERENCES key_word (key_word_id)
GO

ALTER TABLE action_batch_status_ml
    ADD CONSTRAINT fk_action_batch_ml_language
    FOREIGN KEY ( language_code, site_id)
    REFERENCES language ( language_code, site_id)
GO


ALTER TABLE campaign_ml
    ADD CONSTRAINT fk_campaign_language_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE contact_category_ml
    ADD CONSTRAINT fk_contact_category_lang_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE contact_group_type_ml
    ADD CONSTRAINT fk_contact_group_type_lang_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE contact_type_ml
    ADD CONSTRAINT fk_contact_type_lang_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE country_ml
    ADD CONSTRAINT fk_country_language_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE currency_ml
    ADD CONSTRAINT fk_currency_language_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE external_literature_group_ml
    ADD CONSTRAINT fk_external_lit_group_lang_ml
    FOREIGN KEY (language_code, site_id)
    REFERENCES language (language_code, site_id)
GO

ALTER TABLE filter_header
    ADD CONSTRAINT fk_filter_header_user
    FOREIGN KEY (user_id, site_id)
    REFERENCES users (user_id, site_id)

GO

ALTER TABLE filter_detail
    ADD CONSTRAINT fk_filter_detail_filter_header
    FOREIGN KEY (filter_header_id)
    REFERENCES filter_header (filter_header_id)

GO

ALTER TABLE file_location_ml
ADD CONSTRAINT fk_file_location_lang_ml
    FOREIGN KEY (language_code, site_id)
    REFERENCES language (language_code, site_id)
GO

ALTER TABLE file_location_ml
ADD CONSTRAINT fk_file_loc_ml_file_loc
    FOREIGN KEY (file_location_did, site_id)
    REFERENCES file_location (file_location_did, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE fulfillment_type_ml
    ADD CONSTRAINT fk_fulfillment_ml_language
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE incident_category_ml
    ADD CONSTRAINT fk_incident_category_lang_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE incident_product_ml
    ADD CONSTRAINT fk_incident_product_lang_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE language_ml
    ADD CONSTRAINT fk_language_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE language_ml
    ADD CONSTRAINT fk_language_preferred_ml
    FOREIGN KEY (preferred_language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE literature_ship_via_ml
    ADD CONSTRAINT fk_lit_ship_via_language_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE literature_term_ml
    ADD CONSTRAINT fk_lit_term_language_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE milestone_category_ml
    ADD CONSTRAINT fk_milestone_category_lang_ml
    FOREIGN KEY (language_code, site_id)
    REFERENCES language (language_code, site_id)
GO

ALTER TABLE milestone_action_ml
    ADD CONSTRAINT fk_milestone_action_lang_ml
    FOREIGN KEY (language_code, site_id)
    REFERENCES language (language_code, site_id)
GO

ALTER TABLE note ADD CONSTRAINT fk_note_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE note ADD CONSTRAINT fk_note_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE onyx_resource_ml
    ADD CONSTRAINT fk_onyx_resource_language_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE order_line_status_ml
    ADD CONSTRAINT fk_order_line_status_ml_lang
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE product_ml
    ADD CONSTRAINT fk_product_language_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE product_group_ml
    ADD CONSTRAINT fk_product_group_language_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE QUESTION_ML
    ADD CONSTRAINT FK_QUESTION_LANGUAGE_ML
    FOREIGN KEY (language_code,site_id)
    REFERENCES LANGUAGE (language_code,site_id)
GO

ALTER TABLE reference_field_ml
    ADD CONSTRAINT fk_reference_field_language_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE reference_parameter_ml
    ADD CONSTRAINT fk_reference_parameter_lang_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE region_ml
    ADD CONSTRAINT fk_region_language_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE RESPONSE_ML
    ADD CONSTRAINT FK_RESPONSE_LANGUAGE_ML
    FOREIGN KEY (language_code,site_id)
    REFERENCES LANGUAGE (language_code,site_id)
GO

ALTER TABLE role_ml
    ADD CONSTRAINT fk_role_language_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE search_operator_ml
    ADD CONSTRAINT fk_search_operator_language_ml
    FOREIGN KEY (language_code, site_id)
    REFERENCES language (language_code, site_id)

GO

ALTER TABLE search_table_ml
    ADD CONSTRAINT fk_search_table_language_ml
    FOREIGN KEY (language_code, site_id)
    REFERENCES language (language_code, site_id)
GO

ALTER TABLE search_view_ml
    ADD CONSTRAINT fk_search_view_language_ml
    FOREIGN KEY (language_code, site_id)
    REFERENCES language (language_code, site_id)
GO

ALTER TABLE search_view_detail_ml
    ADD CONSTRAINT fk_search_view_detail_lang_ml
    FOREIGN KEY (language_code, site_id)
    REFERENCES language (language_code, site_id)
GO

ALTER TABLE site_ml
    ADD CONSTRAINT fk_site_language_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE SURVEY_ML
    ADD CONSTRAINT FK_SURVEY_LANGUAGE_ML
    FOREIGN KEY (language_code,site_id)
    REFERENCES LANGUAGE (language_code,site_id)
GO

ALTER TABLE SURVEY_TYPE_ML
    ADD CONSTRAINT FK_SURVEY_TYPE_LANGUAGE_ML
    FOREIGN KEY (language_code,site_id)
    REFERENCES LANGUAGE (language_code,site_id)
GO

ALTER TABLE system_parameter_ml
    ADD CONSTRAINT fk_system_parameter_lang_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE table_administration_item_ml
    ADD CONSTRAINT fk_table_admin_item_lang_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE task_category_ml
    ADD CONSTRAINT fk_task_category_language_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE template_ml
    ADD CONSTRAINT fk_template_language_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE template_type_ml
    ADD CONSTRAINT fk_template_type_language_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE tracking_code_ml
    ADD CONSTRAINT fk_tracking_code_language_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE tracking_code_type_ml
    ADD CONSTRAINT fk_tracking_code_type_lang_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE user_group_ml
    ADD CONSTRAINT fk_user_group_language_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE national_language
    ADD CONSTRAINT fk_national_language_language
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE nat_lang_category_ml
    ADD CONSTRAINT fk_nat_lang_category_lang_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE nat_lang_config
    ADD CONSTRAINT fk_nat_lang_config_language
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE onyx_session
    ADD CONSTRAINT fk_onyx_session_language
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)
GO

ALTER TABLE users
    ADD CONSTRAINT fk_users_language
    FOREIGN KEY (language_code,site_id)
    REFERENCES language (language_code,site_id)

GO

ALTER TABLE literature_order_header
    ADD CONSTRAINT fk_lit_header_lit_msg
    FOREIGN KEY (literature_message_id)
    REFERENCES literature_message (literature_message_id)
GO

ALTER TABLE literature_order_detail
    ADD CONSTRAINT fk_lit_detail_lit_batch
    FOREIGN KEY (literature_order_batch_id)
    REFERENCES literature_order_batch (literature_order_batch_id)
GO

ALTER TABLE literature_order_detail
    ADD CONSTRAINT fk_lit_detail_lit_header
    FOREIGN KEY (literature_order_header_id)
    REFERENCES literature_order_header (literature_order_header_id)
GO

ALTER TABLE literature_order_detail
    ADD CONSTRAINT fk_order_detail_product
    FOREIGN KEY (literature_product_code,site_id)
    REFERENCES literature_product (literature_product_code,site_id)
GO

ALTER TABLE lit_prod_fulfill_type_assoc
    ADD CONSTRAINT fk_lit_prod_fill_type_lit_prod
    FOREIGN KEY (literature_product_code, site_id)
    REFERENCES literature_product (literature_product_code, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE system_document
    ADD CONSTRAINT fk_system_document_lit_prod
    FOREIGN KEY (literature_product_code, site_id)
    REFERENCES literature_product (literature_product_code, site_id)
GO

ALTER TABLE literature_product
    ADD CONSTRAINT fk_literature_product_label
    FOREIGN KEY (label_product_code,site_id)
    REFERENCES literature_product (literature_product_code ,site_id)
GO

ALTER TABLE literature_product
    ADD CONSTRAINT fk_literature_product_printer
    FOREIGN KEY (literature_service_printer_did,site_id)
    REFERENCES literature_service_printer (literature_service_printer_did,site_id)
GO

ALTER TABLE literature_service_printer_ml
    ADD CONSTRAINT fk_lit_service_printer_ml
    FOREIGN KEY (literature_service_printer_did,site_id)
    REFERENCES literature_service_printer (literature_service_printer_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE literature_service_printer_ml
    ADD CONSTRAINT fk_literature_service_printer_ml_language
    FOREIGN KEY ( language_code, site_id)
    REFERENCES language ( language_code, site_id)
GO

ALTER TABLE literature_order_header
    ADD CONSTRAINT fk_lit_header_lit_ship_via
    FOREIGN KEY (literature_ship_via_did,site_id)
    REFERENCES literature_ship_via (literature_ship_via_did,site_id)
GO

ALTER TABLE literature_ship_via_ml
    ADD CONSTRAINT fk_literature_ship_via_ml
    FOREIGN KEY (literature_ship_via_did,site_id)
    REFERENCES literature_ship_via (literature_ship_via_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE literature_term_ml
    ADD CONSTRAINT fk_literature_term_ml
    FOREIGN KEY (literature_term_did,site_id)
    REFERENCES literature_term (literature_term_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE literature_order_header
    ADD CONSTRAINT fk_lit_order_lit_term
    FOREIGN KEY (literature_term_did,site_id)
    REFERENCES literature_term (literature_term_did,site_id)
GO

ALTER TABLE literature_order_detail
    ADD CONSTRAINT fk_lit_lit_prod_fulfill_assoc
    FOREIGN KEY (literature_product_code, fulfillment_type_code, site_id)
    REFERENCES lit_prod_fulfill_type_assoc(literature_product_code, fulfillment_type_code, site_id)
GO

ALTER TABLE message_destination
    ADD CONSTRAINT fk_mess_dest_message_id
    FOREIGN KEY (message_id)
    REFERENCES message (message_id)
GO

ALTER TABLE nat_lang_category_ml
    ADD CONSTRAINT fk_nat_lang_category_ml
    FOREIGN KEY (nat_lang_category_did,site_id)
    REFERENCES nat_lang_category (nat_lang_category_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE nat_lang_config
    ADD CONSTRAINT fk_nat_lang_config_category
    FOREIGN KEY (nat_lang_category_did,site_id)
    REFERENCES nat_lang_category (nat_lang_category_did,site_id)
GO

ALTER TABLE national_language
    ADD CONSTRAINT fk_national_language_category
    FOREIGN KEY (nat_lang_category_did,site_id)
    REFERENCES nat_lang_category (nat_lang_category_did,site_id)

GO

ALTER TABLE milestone_category_ml
    ADD CONSTRAINT fk_milestone_category_ml
    FOREIGN KEY (milestone_category_did, site_id)
    REFERENCES milestone_category (milestone_category_did, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE milestone_action_ml
    ADD CONSTRAINT fk_milestone_action_ml
    FOREIGN KEY (milestone_action_did, site_id)
    REFERENCES milestone_action (milestone_action_did, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE template
    ADD CONSTRAINT fk_template_onyx_form
    FOREIGN KEY (onyx_app_code,form_name,site_id)
    REFERENCES onyx_form (onyx_app_code,form_name,site_id)
GO

ALTER TABLE onyx_resource_ml
    ADD CONSTRAINT fk_onyx_resource_ml
    FOREIGN KEY (resource_name,site_id)
    REFERENCES onyx_resource (resource_name,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE role_resource
    ADD CONSTRAINT fk_role_resource_resource
    FOREIGN KEY (resource_name,site_id)
    REFERENCES onyx_resource (resource_name,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE user_resource
    ADD CONSTRAINT fk_user_resource_resource
    FOREIGN KEY (resource_name,site_id)
    REFERENCES onyx_resource (resource_name,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE extended_session
    ADD CONSTRAINT fk_extended_session_session
    FOREIGN KEY (onyx_session_id)
    REFERENCES onyx_session (onyx_session_id)
GO

ALTER TABLE literature_order_detail
    ADD CONSTRAINT fk_lit_ord_det_line_stat
    FOREIGN KEY (order_line_status_code, site_id)
    REFERENCES order_line_status (order_line_status_code, site_id)
GO

ALTER TABLE order_line_status_ml
    ADD CONSTRAINT fk_ord_line_status_ml
    FOREIGN KEY (order_line_status_code, site_id)
    REFERENCES order_line_status (order_line_status_code, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE product_ml
    ADD CONSTRAINT fk_product_ml
    FOREIGN KEY (product_code,site_id)
    REFERENCES product (product_code,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE forecast_detail
    ADD CONSTRAINT fk_forecast_detail_product
    FOREIGN KEY (product_code,site_id)
    REFERENCES product (product_code,site_id)
GO

ALTER TABLE product_header
    ADD CONSTRAINT fk_product_header_product
    FOREIGN KEY (product_code,site_id)
    REFERENCES product (product_code,site_id)
GO

ALTER TABLE quote_detail
    ADD CONSTRAINT fk_quote_detail_product
    FOREIGN KEY (product_code,site_id)
    REFERENCES product (product_code,site_id)
GO

ALTER TABLE literature_product
    ADD CONSTRAINT fk_lit_prod_code_product
    FOREIGN KEY (literature_product_code,site_id)
    REFERENCES product (product_code,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE product_group_ml
    ADD CONSTRAINT fk_product_group_ml
    FOREIGN KEY (product_group_did,site_id)
    REFERENCES product_group (product_group_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE product_group
    ADD CONSTRAINT fk_product_group_parent
    FOREIGN KEY (parent_product_group_did,site_id)
    REFERENCES product_group (product_group_did,site_id)
GO

ALTER TABLE product
    ADD CONSTRAINT fk_product_product_group
    FOREIGN KEY (product_group_did,site_id)
    REFERENCES product_group (product_group_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE product_detail
    ADD CONSTRAINT fk_product_detail_header
    FOREIGN KEY (product_header_id)
    REFERENCES product_header (product_header_id)
GO

ALTER TABLE product
    ADD CONSTRAINT fk_product_support_type
    FOREIGN KEY (product_support_type,site_id)
    REFERENCES product_support_type (product_support_type,site_id)
GO

ALTER TABLE QUESTION_ML
    ADD CONSTRAINT FK_QUESTION_ML
    FOREIGN KEY (QUESTION_DID,SITE_ID)
    REFERENCES QUESTION (QUESTION_DID,SITE_ID)
    ON DELETE CASCADE
GO

ALTER TABLE QUESTION_RESPONSE
    ADD CONSTRAINT FK_QUESTION_RESPONSE_QUESTION
    FOREIGN KEY (QUESTION_DID,SITE_ID)
    REFERENCES QUESTION (QUESTION_DID,SITE_ID)
    ON DELETE CASCADE
GO

ALTER TABLE SURVEY_QUESTION
    ADD CONSTRAINT FK_SURVEY_QUESTION_QUESTION
    FOREIGN KEY (QUESTION_DID,SITE_ID)
    REFERENCES QUESTION (QUESTION_DID,SITE_ID)
    ON DELETE CASCADE
GO

ALTER TABLE OWNER_QUESTION_RESPONSE
    ADD CONSTRAINT FK_OWNER_QUEST_RESP_QUESTION
    FOREIGN KEY (QUESTION_DID,SITE_ID)
    REFERENCES QUESTION (QUESTION_DID,SITE_ID)
GO

ALTER TABLE QUESTION_HIERARCHY
    ADD CONSTRAINT FK_QUEST_HIER_QUEST_RESPONSE
    FOREIGN KEY (QUESTION_DID,RESPONSE_DID,SITE_ID)
    REFERENCES QUESTION_RESPONSE (QUESTION_DID,RESPONSE_DID,SITE_ID)
    ON DELETE CASCADE
GO

ALTER TABLE OWNER_QUESTION_RESPONSE
    ADD CONSTRAINT FK_OWNER_QUEST_RESP_QUEST_RESP
    FOREIGN KEY (QUESTION_DID, RESPONSE_DID, SITE_ID)
    REFERENCES QUESTION_RESPONSE (QUESTION_DID, RESPONSE_DID, SITE_ID)
GO

ALTER TABLE quote_detail
    ADD CONSTRAINT fk_quote_detail_header
    FOREIGN KEY (quote_header_id)
    REFERENCES quote_header (quote_header_id)
GO

ALTER TABLE reference_field
    ADD CONSTRAINT fk_reference_field_parent
    FOREIGN KEY (parent_reference_field_did,site_id)
    REFERENCES reference_field (reference_field_did,site_id)
GO

ALTER TABLE reference_field_ml
    ADD CONSTRAINT fk_reference_field_ml
    FOREIGN KEY (reference_field_did,site_id)
    REFERENCES reference_field (reference_field_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE reference_lookup
    ADD CONSTRAINT fk_reference_lookup_param
    FOREIGN KEY (reference_parameter_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE reference_lookup
    ADD CONSTRAINT fk_reference_lookup_parent
    FOREIGN KEY (parent_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE reference_parameter_ml
    ADD CONSTRAINT fk_reference_parameter_ml
    FOREIGN KEY (reference_parameter_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE address
    ADD CONSTRAINT fk_address_type_ref
    FOREIGN KEY (address_type_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE company
    ADD CONSTRAINT fk_company_type_ref
    FOREIGN KEY (company_type_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE company
    ADD CONSTRAINT fk_company_sub_type_ref
    FOREIGN KEY (company_sub_type_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE company
    ADD CONSTRAINT fk_company_division_ref
    FOREIGN KEY (division_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE company
    ADD CONSTRAINT fk_company_market_sector_ref
    FOREIGN KEY (market_sector_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE company
    ADD CONSTRAINT fk_company_source_ref
    FOREIGN KEY (source_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE company
    ADD CONSTRAINT fk_company_status_ref
    FOREIGN KEY (status_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE file_link
ADD CONSTRAINT fk_file_link_category_did
    FOREIGN KEY (link_category_did, site_id)
    REFERENCES reference_parameter (reference_parameter_did, site_id)
GO

ALTER TABLE forecast_detail
    ADD CONSTRAINT fk_discount_type_ref
    FOREIGN KEY (discount_type_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE forecast_header
    ADD CONSTRAINT fk_forecast_header_status_ref
    FOREIGN KEY (status_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE incident
    ADD CONSTRAINT fk_incident_type_ref
    FOREIGN KEY (incident_type_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE incident
    ADD CONSTRAINT fk_incident_source_ref
    FOREIGN KEY (source_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE incident
    ADD CONSTRAINT fk_incident_status_ref
    FOREIGN KEY (status_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE incident
    ADD CONSTRAINT fk_incident_priority_ref
    FOREIGN KEY (priority_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE incident
    ADD CONSTRAINT fk_incident_resolution1_ref
    FOREIGN KEY (resolution_did1,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE incident
    ADD CONSTRAINT fk_incident_resolution2_ref
    FOREIGN KEY (resolution_did2,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE incident
    ADD CONSTRAINT fk_incident_resolution3_ref
    FOREIGN KEY (resolution_did3,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE incident
    ADD CONSTRAINT fk_incident_resolution4_ref
    FOREIGN KEY (resolution_did4,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE incident_product
    ADD CONSTRAINT fk_incident_product_status_ref
    FOREIGN KEY (status_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE individual
    ADD CONSTRAINT fk_individual_user_type_ref
    FOREIGN KEY (user_type_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE individual
    ADD CONSTRAINT fk_individual_sub_type_ref
    FOREIGN KEY (user_sub_type_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE individual
    ADD CONSTRAINT fk_individual_source_ref
    FOREIGN KEY (source_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE individual
    ADD CONSTRAINT fk_individual_status_ref
    FOREIGN KEY (status_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE literature_order_detail
    ADD CONSTRAINT fk_lit_order_detail_source_ref
    FOREIGN KEY (source_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE owner_campaign
    ADD CONSTRAINT fk_owner_campaign_track_code
    FOREIGN KEY (tracking_code_did, site_id)
    REFERENCES tracking_code (tracking_code_did, site_id)
GO

ALTER TABLE owner_campaign_detail
    ADD CONSTRAINT fk_owner_camp_det_owner_camp
    FOREIGN KEY (owner_campaign_id)
    REFERENCES owner_campaign (owner_campaign_id)
GO

ALTER TABLE owner_campaign_detail
    ADD CONSTRAINT fk_owner_camp_det_mile_act
    FOREIGN KEY (milestone_action_did, site_id)
    REFERENCES milestone_action (milestone_action_did, site_id)
GO

ALTER TABLE phone
    ADD CONSTRAINT fk_phone_type_ref
    FOREIGN KEY (phone_type_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE product_header
    ADD CONSTRAINT fk_product_header_source_ref
    FOREIGN KEY (source_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE product_header
    ADD CONSTRAINT fk_product_header_status_ref
    FOREIGN KEY (status_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE product
    ADD CONSTRAINT fk_product_status_ref
    FOREIGN KEY (status_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE quote_detail
    ADD CONSTRAINT fk_quote_detail_discount_ref
    FOREIGN KEY (discount_type_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE quote_header
    ADD CONSTRAINT fk_quote_header_status_ref
    FOREIGN KEY (status_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE task
    ADD CONSTRAINT fk_task_type_ref
    FOREIGN KEY (task_type_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE task
    ADD CONSTRAINT fk_task_status_ref
    FOREIGN KEY (status_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE task
    ADD CONSTRAINT fk_task_priority_ref
    FOREIGN KEY (priority_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE task
    ADD CONSTRAINT fk_task_duration_units
    FOREIGN KEY (duration_units,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE work_ticket
    ADD CONSTRAINT fk_work_ticket_type_ref
    FOREIGN KEY (type_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE work_ticket
    ADD CONSTRAINT fk_work_ticket_severity_ref
    FOREIGN KEY (severity_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE work_ticket
    ADD CONSTRAINT fk_work_ticket_source_ref
    FOREIGN KEY (source_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE work_ticket
    ADD CONSTRAINT fk_work_ticket_status_ref
    FOREIGN KEY (status_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE work_ticket
    ADD CONSTRAINT fk_work_ticket_priority_ref
    FOREIGN KEY (priority_did,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE work_ticket
    ADD CONSTRAINT fk_work_ticket_resolution1_ref
    FOREIGN KEY (resolution_did1,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE work_ticket
    ADD CONSTRAINT fk_work_ticket_resolution2_ref
    FOREIGN KEY (resolution_did2,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE work_ticket
    ADD CONSTRAINT fk_work_ticket_resolution3_ref
    FOREIGN KEY (resolution_did3,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE work_ticket
    ADD CONSTRAINT fk_work_ticket_resolution4_ref
    FOREIGN KEY (resolution_did4,site_id)
    REFERENCES reference_parameter (reference_parameter_did,site_id)
GO

ALTER TABLE work_ticket_audit_log
    ADD CONSTRAINT fk_wrk_tkt_audit_log_wrk_tkt
    FOREIGN KEY (work_ticket_id)
    REFERENCES work_ticket (work_ticket_id)
GO

ALTER TABLE address
    ADD CONSTRAINT fk_address_region
    FOREIGN KEY (region_code,country_code,site_id)
    REFERENCES region (region_code,country_code,site_id)
GO

ALTER TABLE literature_order_header
    ADD CONSTRAINT fk_literature_order_region
    FOREIGN KEY (region_code,country_code,site_id)
    REFERENCES region (region_code,country_code,site_id)
GO

ALTER TABLE region_ml
    ADD CONSTRAINT fk_region_ml
    FOREIGN KEY (region_code,country_code,site_id)
    REFERENCES region (region_code,country_code,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE RESPONSE_ML
    ADD CONSTRAINT FK_RESPONSE_ML
    FOREIGN KEY (RESPONSE_DID,SITE_ID)
    REFERENCES RESPONSE (RESPONSE_DID,SITE_ID)
    ON DELETE CASCADE
GO

ALTER TABLE QUESTION_RESPONSE
    ADD CONSTRAINT FK_QUESTION_RESPONSE_RESPONSE
    FOREIGN KEY (RESPONSE_DID,SITE_ID)
    REFERENCES RESPONSE (RESPONSE_DID,SITE_ID)
    ON DELETE CASCADE
GO

ALTER TABLE OWNER_QUESTION_RESPONSE
    ADD CONSTRAINT FK_OWNER_QUEST_RESP_RESPONSE
    FOREIGN KEY (RESPONSE_DID,SITE_ID)
    REFERENCES RESPONSE (RESPONSE_DID,SITE_ID)
GO

ALTER TABLE role_ml
    ADD CONSTRAINT fk_role_ml
    FOREIGN KEY (role_name,site_id)
    REFERENCES role (role_name,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE role_resource
    ADD CONSTRAINT fk_role_resource_role
    FOREIGN KEY (role_name,site_id)
    REFERENCES role (role_name,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE user_role
    ADD CONSTRAINT fk_user_role_role
    FOREIGN KEY (role_name,site_id)
    REFERENCES role (role_name,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE search_result_default
    ADD CONSTRAINT fk_srch_res_def_srch_view_det
    FOREIGN KEY (search_view_detail_did, site_id)
    REFERENCES search_view_detail (search_view_detail_did, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE search_view_detail
    ADD CONSTRAINT fk_search_view_det_search_view
    FOREIGN KEY (search_view_did, site_id)
    REFERENCES search_view (search_view_did, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE search_view_ml
    ADD CONSTRAINT fk_search_view_ml
    FOREIGN KEY (search_view_did, site_id)
    REFERENCES search_view (search_view_did, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE search_query
    ADD CONSTRAINT fk_search_query_search_view
    FOREIGN KEY (search_view_did, site_id)
    REFERENCES search_view (search_view_did, site_id)
GO

ALTER TABLE search_view_detail
    ADD CONSTRAINT fk_search_view_det_search_tab
    FOREIGN KEY (search_table_did, site_id)
    REFERENCES search_table (search_table_did, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE search_table_ml
    ADD CONSTRAINT fk_search_table_ml
    FOREIGN KEY (search_table_did, site_id)
    REFERENCES search_table (search_table_did, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE search_operator_ml
    ADD CONSTRAINT fk_search_operator_ml
    FOREIGN KEY (search_operator_did, site_id)
    REFERENCES search_operator (search_operator_did, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE search_view_detail_ml
    ADD CONSTRAINT fk_search_view_detail_ml
    FOREIGN KEY (search_view_detail_did, site_id)
    REFERENCES search_view_detail (search_view_detail_did, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE site_ml
    ADD CONSTRAINT fk_site_ml
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
    ON DELETE CASCADE
GO

ALTER TABLE action_batch
    ADD CONSTRAINT fk_action_batch_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE action_batch_status
    ADD CONSTRAINT fk_action_batch_status_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE address
    ADD CONSTRAINT fk_address_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE alert 
    ADD CONSTRAINT fk_alert_site  
    FOREIGN KEY (site_id)  
    REFERENCES site (site_id) 
GO

ALTER TABLE batch_source_list_status
    ADD CONSTRAINT fk_batch_source_list_status
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE campaign
    ADD CONSTRAINT fk_campaign_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE company
    ADD CONSTRAINT fk_company_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE company_family
    ADD CONSTRAINT fk_company_family_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE contact_category
    ADD CONSTRAINT fk_contact_category_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE contact_group_type
    ADD CONSTRAINT fk_contact_group_type_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE contact_type
    ADD CONSTRAINT fk_contact_type_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE country
    ADD CONSTRAINT fk_country_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE currency
    ADD CONSTRAINT fk_currency_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE currency_conversion
    ADD CONSTRAINT fk_currency_conversion_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE destination_app
    ADD CONSTRAINT fk_destination_app_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE external_contact
    ADD CONSTRAINT fk_external_contact_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE file_link
ADD CONSTRAINT fk_file_link_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE file_location
ADD CONSTRAINT fk_file_location_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE filter_header
ADD CONSTRAINT fk_filter_header_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE filter_detail
ADD CONSTRAINT fk_filter_detail_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE forecast_detail
    ADD CONSTRAINT fk_forecast_detail_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE forecast_header
    ADD CONSTRAINT fk_forecast_header_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE fulfillment_engine
    ADD CONSTRAINT fk_fulfillment_engine_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE fulfillment_type
    ADD CONSTRAINT fk_fulfillment_type_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE incident
    ADD CONSTRAINT fk_incident_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE incident_category
    ADD CONSTRAINT fk_incident_category_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE incident_product
    ADD CONSTRAINT fk_incident_product_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE individual
    ADD CONSTRAINT fk_individual_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE internal_contact
    ADD CONSTRAINT fk_internal_contact_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE key_word
    ADD CONSTRAINT fk_key_word_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE key_word_association
    ADD CONSTRAINT fk_key_word_association_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE language
    ADD CONSTRAINT fk_language_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE lit_prod_fulfill_type_assoc
    ADD CONSTRAINT fk_lit_prod_fill_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE literature_message
    ADD CONSTRAINT fk_literature_message_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE literature_order_batch
    ADD CONSTRAINT fk_lit_order_batch_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE literature_order_detail
    ADD CONSTRAINT fk_lit_order_detail_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE literature_order_header
    ADD CONSTRAINT fk_lit_order_header_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE literature_product
    ADD CONSTRAINT fk_literature_product_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE literature_service_printer
    ADD CONSTRAINT fk_lit_service_printer_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE literature_ship_via
    ADD CONSTRAINT fk_literature_ship_via_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE literature_term
    ADD CONSTRAINT fk_literature_term_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE message
    ADD CONSTRAINT fk_message_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE message_destination
    ADD CONSTRAINT fk_message_destination_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE milestone_action
    ADD CONSTRAINT fk_milestone_action_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE milestone_category
    ADD CONSTRAINT fk_milestone_category_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE national_language
    ADD CONSTRAINT fk_national_language_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE nat_lang_category
    ADD CONSTRAINT fk_nat_lang_category_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE nat_lang_config
    ADD CONSTRAINT fk_nat_lang_config_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE network_user
    ADD CONSTRAINT fk_network_user_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE onyx_form
    ADD CONSTRAINT fk_onyx_form_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE onyx_resource
    ADD CONSTRAINT fk_onyx_resource_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE onyx_session
    ADD CONSTRAINT fk_onyx_session_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE order_line_status
    ADD CONSTRAINT fk_order_line_status_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE order_line_status_ml
    ADD CONSTRAINT fk_order_line_status_ml_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE owner_campaign
    ADD CONSTRAINT fk_owner_campaign_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE owner_campaign_detail
    ADD CONSTRAINT fk_owner_campaign_detail_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE phone
    ADD CONSTRAINT fk_phone_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE product
    ADD CONSTRAINT fk_product_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE product_detail
    ADD CONSTRAINT fk_product_detail_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE product_group
    ADD CONSTRAINT fk_product_group_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE product_header
    ADD CONSTRAINT fk_product_header_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE product_support_type
    ADD CONSTRAINT fk_product_support_type_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE QUESTION
    ADD CONSTRAINT FK_QUESTION_SITE
    FOREIGN KEY (SITE_ID)
    REFERENCES SITE (SITE_ID)
GO

ALTER TABLE QUESTION_HIERARCHY
    ADD CONSTRAINT FK_QUESTION_HIERARCHY_SITE
    FOREIGN KEY (SITE_ID)
    REFERENCES SITE (SITE_ID)
GO

ALTER TABLE QUESTION_RESPONSE
    ADD CONSTRAINT FK_QUESTION_RESPONSE_SITE
    FOREIGN KEY (SITE_ID)
    REFERENCES SITE (SITE_ID)
GO

ALTER TABLE quote_detail
    ADD CONSTRAINT fk_quote_detail_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE quote_header
    ADD CONSTRAINT fk_quote_header_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE reference_field
    ADD CONSTRAINT fk_reference_field_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE reference_lookup
    ADD CONSTRAINT fk_reference_lookup_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE reference_parameter
    ADD CONSTRAINT fk_reference_parameter_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE region
    ADD CONSTRAINT fk_region_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE reminder
    ADD CONSTRAINT fk_reminder_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE RESPONSE
    ADD CONSTRAINT FK_RESPONSE_SITE
    FOREIGN KEY (SITE_ID)
    REFERENCES SITE (SITE_ID)
GO

ALTER TABLE role
    ADD CONSTRAINT fk_role_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE role_resource
    ADD CONSTRAINT fk_role_resource_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE search_query
    ADD CONSTRAINT fk_search_query_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE search_operator
    ADD CONSTRAINT fk_search_operator_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE search_result_default
    ADD CONSTRAINT fk_search_result_default_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE search_table
    ADD CONSTRAINT fk_search_table_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE search_view
    ADD CONSTRAINT fk_search_view_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE search_view_detail
    ADD CONSTRAINT fk_search_view_detail_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE subsystem
    ADD CONSTRAINT fk_subsystem_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE SURVEY
    ADD CONSTRAINT FK_SURVEY_SITE
    FOREIGN KEY (SITE_ID)
    REFERENCES SITE (SITE_ID)
GO

ALTER TABLE OWNER_SURVEY_ASSOCIATION
    ADD CONSTRAINT FK_OWNER_SURVEY_ASSOC_SITE
    FOREIGN KEY (SITE_ID)
    REFERENCES SITE (SITE_ID)
GO

ALTER TABLE SURVEY_QUESTION
    ADD CONSTRAINT FK_SURVEY_QUESTION_SITE
    FOREIGN KEY (SITE_ID)
    REFERENCES SITE (SITE_ID)
GO

ALTER TABLE OWNER_QUESTION_RESPONSE
    ADD CONSTRAINT FK_OWNER_QUEST_RESP_SITE
    FOREIGN KEY (SITE_ID)
    REFERENCES SITE (SITE_ID)
GO

ALTER TABLE SURVEY_TYPE
    ADD CONSTRAINT FK_SURVEY_TYPE_SITE
    FOREIGN KEY (SITE_ID)
    REFERENCES SITE (SITE_ID)
GO

ALTER TABLE system_document
    ADD CONSTRAINT fk_system_document_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE system_parameter
    ADD CONSTRAINT fk_system_parameter_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE table_administration_item
    ADD CONSTRAINT fk_table_admin_item_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE task
    ADD CONSTRAINT fk_task_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE task_category
    ADD CONSTRAINT fk_task_category_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE template
    ADD CONSTRAINT fk_template_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE template_type
    ADD CONSTRAINT fk_template_type_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE tracking_code
    ADD CONSTRAINT fk_tracking_code_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE tracking_code_milestone
    ADD CONSTRAINT fk_tracking_milestone_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE tracking_code_type
    ADD CONSTRAINT fk_tracking_code_type_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE users
    ADD CONSTRAINT fk_users_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE user_group
    ADD CONSTRAINT fk_user_group_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE user_preference
    ADD CONSTRAINT fk_user_preference_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE user_preference
    ADD CONSTRAINT fk_user_preference_profile
    FOREIGN KEY (profile_code, site_id)
    REFERENCES profile (profile_code, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE user_resource
    ADD CONSTRAINT fk_user_resource_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE user_role
    ADD CONSTRAINT fk_user_role_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE work_ticket
    ADD CONSTRAINT fk_work_ticket_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE work_ticket_association
    ADD CONSTRAINT fk_work_ticket_assoc_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE work_note_detail
    ADD CONSTRAINT fk_work_note_detail_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE work_note_header
    ADD CONSTRAINT fk_work_note_header_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE partner 
    ADD CONSTRAINT fk_partner_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE partner_access 
    ADD CONSTRAINT fk_partner_access_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE partner_group 
    ADD CONSTRAINT fk_partner_group_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE partner_group_access 
    ADD CONSTRAINT fk_partner_group_access_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE partner_user 
    ADD CONSTRAINT fk_partner_user_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE user_access 
    ADD CONSTRAINT fk_user_access_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE user_customer_association 
    ADD CONSTRAINT fk_user_customer_assoc_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE user_partner_group 
    ADD CONSTRAINT fk_user_partner_group_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE external_user
    ADD CONSTRAINT fk_external_user_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE external_literature_group
    ADD CONSTRAINT fk_external_lit_group_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE action_batch
    ADD CONSTRAINT fk_action_batch_subsystem
    FOREIGN KEY (subsystem_did, site_id)
    REFERENCES subsystem (subsystem_did, site_id)
GO

ALTER TABLE literature_order_batch
    ADD CONSTRAINT fk_lit_order_batch_subsystem
    FOREIGN KEY (subsystem_did, site_id)
    REFERENCES subsystem (subsystem_did, site_id)
GO

ALTER TABLE literature_order_detail
    ADD CONSTRAINT fk_lit_order_detail_subsystem
    FOREIGN KEY (subsystem_did, site_id)
    REFERENCES subsystem (subsystem_did, site_id)
GO

ALTER TABLE system_document
    ADD CONSTRAINT fk_system_document_subsystem
    FOREIGN KEY (subsystem_did, site_id)
    REFERENCES subsystem (subsystem_did, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE subsystem_ml
    ADD CONSTRAINT fk_subsystem_ml
    FOREIGN KEY (subsystem_did, site_id)
    REFERENCES subsystem (subsystem_did, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE SURVEY_ML
    ADD CONSTRAINT FK_SURVEY_ML
    FOREIGN KEY (SURVEY_DID,SITE_ID)
    REFERENCES SURVEY (SURVEY_DID,SITE_ID)
    ON DELETE CASCADE
GO

ALTER TABLE OWNER_SURVEY_ASSOCIATION
    ADD CONSTRAINT FK_OWNER_SURVEY_ASSOC_SURVEY
    FOREIGN KEY (SURVEY_DID,SITE_ID)
    REFERENCES SURVEY (SURVEY_DID,SITE_ID)
GO

ALTER TABLE SURVEY_QUESTION
    ADD CONSTRAINT FK_SURVEY_QUESTION_SURVEY
    FOREIGN KEY (SURVEY_DID,SITE_ID)
    REFERENCES SURVEY (SURVEY_DID,SITE_ID)
    ON DELETE CASCADE
GO

ALTER TABLE SURVEY_TYPE_ML
    ADD CONSTRAINT FK_SURVEY_TYPE_ML
    FOREIGN KEY (SURVEY_TYPE_DID,SITE_ID)
    REFERENCES SURVEY_TYPE (SURVEY_TYPE_DID,SITE_ID)
    ON DELETE CASCADE
GO

ALTER TABLE SURVEY
    ADD CONSTRAINT FK_SURVEY_SURVEY_TYPE
    FOREIGN KEY (SURVEY_TYPE_DID,SITE_ID)
    REFERENCES SURVEY_TYPE (SURVEY_TYPE_DID,SITE_ID)
GO

ALTER TABLE QUESTION_HIERARCHY
    ADD CONSTRAINT FK_QUEST_HIER_SURVEY_QUEST
    FOREIGN KEY (SURVEY_DID,QUESTION_DID,SITE_ID)
    REFERENCES SURVEY_QUESTION (SURVEY_DID,QUESTION_DID,SITE_ID)
GO

ALTER TABLE QUESTION_HIERARCHY
    ADD CONSTRAINT FK_QUEST_HIER_SURVEY_QUEST_NXT
    FOREIGN KEY (SURVEY_DID,NEXT_QUESTION_DID,SITE_ID)
    REFERENCES SURVEY_QUESTION (SURVEY_DID,QUESTION_DID,SITE_ID)
GO

ALTER TABLE system_parameter_ml
    ADD CONSTRAINT fk_system_parameter_ml
    FOREIGN KEY (parameter_code,site_id)
    REFERENCES system_parameter (parameter_code,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE table_administration_item_ml
    ADD CONSTRAINT fk_table_admin_item_ml
    FOREIGN KEY (table_administration_item_did,site_id)
    REFERENCES table_administration_item (table_administration_item_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE task
    ADD CONSTRAINT fk_task_task_category
    FOREIGN KEY (task_category_did,site_id)
    REFERENCES task_category (task_category_did,site_id)
GO

ALTER TABLE task_category_ml
    ADD CONSTRAINT fk_task_category_ml
    FOREIGN KEY (task_category_did,site_id)
    REFERENCES task_category (task_category_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE template_ml
    ADD CONSTRAINT fk_template_ml
    FOREIGN KEY (template_did,site_id)
    REFERENCES template (template_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE template_type_ml
    ADD CONSTRAINT fk_template_type_ml
    FOREIGN KEY (template_type_code,site_id)
    REFERENCES template_type (template_type_code,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE template
    ADD CONSTRAINT fk_template_type
    FOREIGN KEY (template_type_code,site_id)
    REFERENCES template_type (template_type_code,site_id)
GO

ALTER TABLE tracking_code_ml
    ADD CONSTRAINT fk_tracking_code_ml
    FOREIGN KEY (tracking_code_did,site_id)
    REFERENCES tracking_code (tracking_code_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE tracking_code_milestone
    ADD CONSTRAINT fk_track_code_milestone_track
    FOREIGN KEY (tracking_code_did,site_id)
    REFERENCES tracking_code (tracking_code_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE tracking_code_milestone
    ADD CONSTRAINT fk_track_code_milestone_cat
    FOREIGN KEY (milestone_category_did,site_id)
    REFERENCES milestone_category (milestone_category_did, site_id)
GO

ALTER TABLE tracking_code_milestone
    ADD CONSTRAINT fk_track_code_milestone_action
    FOREIGN KEY (milestone_action_did,site_id)
    REFERENCES milestone_action (milestone_action_did, site_id)
GO

ALTER TABLE literature_order_header
    ADD CONSTRAINT fk_order_header_tracking
    FOREIGN KEY (tracking_code_did,site_id)
    REFERENCES tracking_code (tracking_code_did,site_id)
GO

ALTER TABLE incident
    ADD CONSTRAINT fk_incident_tracking_code
    FOREIGN KEY (tracking_code_did,site_id)
    REFERENCES tracking_code (tracking_code_did,site_id)
GO

ALTER TABLE product_header
    ADD CONSTRAINT fk_product_header_tracking
    FOREIGN KEY (tracking_code_did,site_id)
    REFERENCES tracking_code (tracking_code_did,site_id)
GO

ALTER TABLE task
    ADD CONSTRAINT fk_task_tracking_code
    FOREIGN KEY (tracking_code_did,site_id)
    REFERENCES tracking_code (tracking_code_did,site_id)
GO

ALTER TABLE tracking_code
    ADD CONSTRAINT fk_tracking_code_tracking_type
    FOREIGN KEY (tracking_code_type_did,site_id)
    REFERENCES tracking_code_type (tracking_code_type_did,site_id)
GO

ALTER TABLE tracking_code_type_ml
    ADD CONSTRAINT fk_tracking_code_type_ml
    FOREIGN KEY (tracking_code_type_did,site_id)
    REFERENCES tracking_code_type (tracking_code_type_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE internal_contact
    ADD CONSTRAINT fk_internal_contact_users
    FOREIGN KEY (user_id,site_id)
    REFERENCES users (user_id,site_id)
GO

ALTER TABLE incident
    ADD CONSTRAINT fk_incident_users
    FOREIGN KEY (assigned_to,site_id)
    REFERENCES users (user_id,site_id)
GO

ALTER TABLE message
    ADD CONSTRAINT fk_message_sender_id
    FOREIGN KEY (sender_user_id,site_id)
    REFERENCES users (user_id,site_id)
GO

ALTER TABLE message_destination
    ADD CONSTRAINT fk_mess_dest_recipient_id
    FOREIGN KEY (recipient_user_id,site_id)
    REFERENCES users (user_id,site_id)
GO

ALTER TABLE network_user
    ADD CONSTRAINT fk_network_user_users
    FOREIGN KEY (user_id,site_id)
    REFERENCES users (user_id,site_id)
GO

ALTER TABLE onyx_session
    ADD CONSTRAINT fk_onyx_session_users
    FOREIGN KEY (user_id,site_id)
    REFERENCES users (user_id,site_id)
GO

ALTER TABLE reminder
    ADD CONSTRAINT fk_reminder_users
    FOREIGN KEY (user_id,site_id)
    REFERENCES users (user_id,site_id)
GO

ALTER TABLE task
    ADD CONSTRAINT fk_task_assigned_to
    FOREIGN KEY (assigned_to,site_id)
    REFERENCES users (user_id,site_id)

GO

ALTER TABLE user_group
    ADD CONSTRAINT fk_user_group_manager
    FOREIGN KEY (manager_id,site_id)
    REFERENCES users (user_id,site_id)
GO

ALTER TABLE user_group
    ADD CONSTRAINT fk_user_group_escalation
    FOREIGN KEY (escalation_id,site_id)
    REFERENCES users (user_id,site_id)
GO

ALTER TABLE user_preference
    ADD CONSTRAINT fk_user_preference_users
    FOREIGN KEY (user_id,site_id)
    REFERENCES users (user_id,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE user_resource
    ADD CONSTRAINT fk_user_resource_users
    FOREIGN KEY (user_id,site_id)
    REFERENCES users (user_id,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE user_role
    ADD CONSTRAINT fk_user_role_users
    FOREIGN KEY (user_id,site_id)
    REFERENCES users (user_id,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE users
    ADD CONSTRAINT fk_users_manager
    FOREIGN KEY (manager_id,site_id)
    REFERENCES users (user_id,site_id)
GO

ALTER TABLE onyx_session
    ADD CONSTRAINT fk_onyx_session_impersonate
    FOREIGN KEY (impersonating_user_id,site_id)
    REFERENCES users (user_id,site_id)
GO

ALTER TABLE action_batch
    ADD CONSTRAINT fk_action_batch_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE action_batch
    ADD CONSTRAINT fk_action_batch_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE action_batch_status
    ADD CONSTRAINT fk_action_batch_stat_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE action_batch_status
    ADD CONSTRAINT fk_action_batch_stat_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE address
    ADD CONSTRAINT fk_address_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE address
    ADD CONSTRAINT fk_address_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE alert ADD CONSTRAINT fk_alert_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE alert ADD CONSTRAINT fk_alert_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE batch_source_list_status
    ADD CONSTRAINT fk_batch_source_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE batch_source_list_status
    ADD CONSTRAINT fk_batch_source_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE campaign
    ADD CONSTRAINT fk_campaign_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE campaign
    ADD CONSTRAINT fk_campaign_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE company
    ADD CONSTRAINT fk_company_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE company
    ADD CONSTRAINT fk_company_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE company_family ADD CONSTRAINT fk_company_family_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE company_family ADD CONSTRAINT fk_company_family_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE contact_category ADD CONSTRAINT fk_contact_category_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE contact_category ADD CONSTRAINT fk_contact_category_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE contact_group_type ADD CONSTRAINT fk_cont_group_type_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE contact_group_type ADD CONSTRAINT fk_cont_group_type_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE contact_type ADD CONSTRAINT fk_contact_type_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE contact_type ADD CONSTRAINT fk_contact_type_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE country ADD CONSTRAINT fk_country_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE country ADD CONSTRAINT fk_country_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE currency ADD CONSTRAINT fk_currency_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE currency ADD CONSTRAINT fk_currency_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE currency_conversion ADD CONSTRAINT fk_currency_conver_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE currency_conversion ADD CONSTRAINT fk_currency_conver_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE destination_app ADD CONSTRAINT fk_destination_app_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE destination_app ADD CONSTRAINT fk_destination_app_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE external_contact ADD CONSTRAINT fk_external_contact_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE external_contact ADD CONSTRAINT fk_external_contact_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE filter_header
    ADD CONSTRAINT fk_filter_header_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE filter_header
    ADD CONSTRAINT fk_filter_header_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)


GO

ALTER TABLE filter_detail
    ADD CONSTRAINT fk_filter_detail_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)


GO

ALTER TABLE filter_detail
    ADD CONSTRAINT fk_filter_detail_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)

GO

ALTER TABLE file_link ADD CONSTRAINT fk_file_link_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE file_link ADD CONSTRAINT fk_file_link_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE file_location ADD CONSTRAINT fk_file_location_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE file_location ADD CONSTRAINT fk_file_location_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE forecast_detail ADD CONSTRAINT fk_forecast_detail_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE forecast_detail ADD CONSTRAINT fk_forecast_detail_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE forecast_header ADD CONSTRAINT fk_forecast_header_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE forecast_header ADD CONSTRAINT fk_forecast_header_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE fulfillment_engine ADD CONSTRAINT fk_fulfill_engine_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE fulfillment_engine ADD CONSTRAINT fk_fulfill_engine_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE fulfillment_type ADD CONSTRAINT fk_fulfillment_type_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE fulfillment_type ADD CONSTRAINT fk_fulfillment_type_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE incident ADD CONSTRAINT fk_incident_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE incident ADD CONSTRAINT fk_incident_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)

GO

ALTER TABLE incident_category ADD CONSTRAINT fk_incident_category_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE incident_category ADD CONSTRAINT fk_incident_category_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE incident_product ADD CONSTRAINT fk_incident_product_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE incident_product ADD CONSTRAINT fk_incident_product_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE individual ADD CONSTRAINT fk_individual_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE individual ADD CONSTRAINT fk_individual_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE internal_contact ADD CONSTRAINT fk_internal_contact_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE internal_contact ADD CONSTRAINT fk_internal_contact_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE key_word ADD CONSTRAINT fk_key_word_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE key_word ADD CONSTRAINT fk_key_word_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE key_word_association ADD CONSTRAINT fk_key_word_assoc_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE key_word_association ADD CONSTRAINT fk_key_word_assoc_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE language ADD CONSTRAINT fk_language_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE language ADD CONSTRAINT fk_language_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE lit_prod_fulfill_type_assoc ADD CONSTRAINT fk_lit_prod_fill_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE lit_prod_fulfill_type_assoc ADD CONSTRAINT fk_lit_prod_fill_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE literature_order_batch ADD CONSTRAINT fk_lit_order_batch_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE literature_message
    ADD CONSTRAINT fk_literature_msg_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE literature_message
    ADD CONSTRAINT fk_literature_msg_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE literature_order_batch ADD CONSTRAINT fk_lit_order_batch_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE literature_order_detail ADD CONSTRAINT fk_lit_order_detail_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE literature_order_detail ADD CONSTRAINT fk_lit_order_detail_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE literature_order_header ADD CONSTRAINT fk_lit_order_header_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE literature_order_header ADD CONSTRAINT fk_lit_order_header_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE literature_product ADD CONSTRAINT fk_lit_product_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE literature_product ADD CONSTRAINT fk_lit_product_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE literature_service_printer ADD CONSTRAINT fk_lit_serv_printer_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE literature_service_printer ADD CONSTRAINT fk_lit_serv_printer_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE literature_ship_via ADD CONSTRAINT fk_lit_ship_via_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE literature_ship_via ADD CONSTRAINT fk_lit_ship_via_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE literature_term ADD CONSTRAINT fk_literature_term_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE literature_term ADD CONSTRAINT fk_literature_term_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE message ADD CONSTRAINT fk_message_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE message ADD CONSTRAINT fk_message_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE message_destination ADD CONSTRAINT fk_message_dest_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE message_destination ADD CONSTRAINT fk_message_dest_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE milestone_action ADD CONSTRAINT fk_milestone_action_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE milestone_action ADD CONSTRAINT fk_milestone_action_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE milestone_category ADD CONSTRAINT fk_milestone_cat_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE milestone_category ADD CONSTRAINT fk_milestone_cat_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE national_language ADD CONSTRAINT fk_national_language_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE national_language ADD CONSTRAINT fk_national_language_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE nat_lang_category ADD CONSTRAINT fk_nat_lang_category_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE nat_lang_category ADD CONSTRAINT fk_nat_lang_category_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE nat_lang_config ADD CONSTRAINT fk_nat_lang_config_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE nat_lang_config ADD CONSTRAINT fk_nat_lang_config_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE network_user ADD CONSTRAINT fk_network_user_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE network_user ADD CONSTRAINT fk_network_user_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE onyx_form ADD CONSTRAINT fk_onyx_form_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE onyx_form ADD CONSTRAINT fk_onyx_form_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE onyx_resource ADD CONSTRAINT fk_onyx_resource_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE onyx_resource ADD CONSTRAINT fk_onyx_resource_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE order_line_status ADD CONSTRAINT fk_order_line_status_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE order_line_status ADD CONSTRAINT fk_order_line_status_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE phone ADD CONSTRAINT fk_phone_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE phone ADD CONSTRAINT fk_phone_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE product ADD CONSTRAINT fk_product_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE product ADD CONSTRAINT fk_product_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE product_detail ADD CONSTRAINT fk_product_detail_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE product_detail ADD CONSTRAINT fk_product_detail_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE product_group ADD CONSTRAINT fk_product_group_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE product_group ADD CONSTRAINT fk_product_group_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE product_header ADD CONSTRAINT fk_product_header_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE product_header ADD CONSTRAINT fk_product_header_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE product_support_type ADD CONSTRAINT fk_prod_support_type_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE product_support_type ADD CONSTRAINT fk_prod_support_type_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE owner_campaign ADD CONSTRAINT fk_owner_campaign_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE owner_campaign ADD CONSTRAINT fk_owner_campaign_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE owner_campaign_detail ADD CONSTRAINT fk_owner_camp_det_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE owner_campaign_detail ADD CONSTRAINT fk_owner_camp_det_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE QUESTION ADD CONSTRAINT FK_QUESTION_INSERT_BY
    FOREIGN KEY (INSERT_BY, SITE_ID)
    REFERENCES USERS (USER_ID, SITE_ID)
GO

ALTER TABLE QUESTION ADD CONSTRAINT FK_QUESTION_UPDATE_BY
    FOREIGN KEY (UPDATE_BY, SITE_ID)
    REFERENCES USERS (USER_ID, SITE_ID)
GO

ALTER TABLE QUESTION_HIERARCHY ADD CONSTRAINT FK_QUESTION_HIER_INSERT_BY
    FOREIGN KEY (INSERT_BY, SITE_ID)
    REFERENCES USERS (USER_ID, SITE_ID)
GO

ALTER TABLE QUESTION_HIERARCHY ADD CONSTRAINT FK_QUESTION_HIER_UPDATE_BY
    FOREIGN KEY (UPDATE_BY, SITE_ID)
    REFERENCES USERS (USER_ID, SITE_ID)
GO

ALTER TABLE QUESTION_RESPONSE ADD CONSTRAINT FK_QUESTION_RESPONSE_INSERT_BY
    FOREIGN KEY (INSERT_BY, SITE_ID)
    REFERENCES USERS (USER_ID, SITE_ID)
GO

ALTER TABLE QUESTION_RESPONSE ADD CONSTRAINT FK_QUESTION_RESPONSE_UPDATE_BY
    FOREIGN KEY (UPDATE_BY, SITE_ID)
    REFERENCES USERS (USER_ID, SITE_ID)
GO

ALTER TABLE quote_detail ADD CONSTRAINT fk_quote_detail_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE quote_detail ADD CONSTRAINT fk_quote_detail_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE quote_header ADD CONSTRAINT fk_quote_header_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE quote_header ADD CONSTRAINT fk_quote_header_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE reference_field ADD CONSTRAINT fk_reference_field_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE reference_field ADD CONSTRAINT fk_reference_field_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE reference_lookup ADD CONSTRAINT fk_reference_lookup_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE reference_lookup ADD CONSTRAINT fk_reference_lookup_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE reference_parameter ADD CONSTRAINT fk_reference_param_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE reference_parameter ADD CONSTRAINT fk_reference_param_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE region ADD CONSTRAINT fk_region_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE region ADD CONSTRAINT fk_region_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE reminder ADD CONSTRAINT fk_reminder_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE reminder ADD CONSTRAINT fk_reminder_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE RESPONSE ADD CONSTRAINT FK_RESPONSE_INSERT_BY
    FOREIGN KEY (INSERT_BY, SITE_ID)
    REFERENCES USERS (USER_ID, SITE_ID)
GO

ALTER TABLE RESPONSE ADD CONSTRAINT FK_RESPONSE_UPDATE_BY
    FOREIGN KEY (UPDATE_BY, SITE_ID)
    REFERENCES USERS (USER_ID, SITE_ID)
GO

ALTER TABLE role ADD CONSTRAINT fk_role_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE role ADD CONSTRAINT fk_role_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE role_resource ADD CONSTRAINT fk_role_resource_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE role_resource ADD CONSTRAINT fk_role_resource_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE search_query ADD CONSTRAINT fk_search_query_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE search_query ADD CONSTRAINT fk_search_query_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE search_operator ADD CONSTRAINT fk_search_operator_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE search_operator ADD CONSTRAINT fk_search_operator_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE search_result_default ADD CONSTRAINT fk_search_result_def_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE search_result_default ADD CONSTRAINT fk_search_result_def_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE search_table ADD CONSTRAINT fk_search_table_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE search_table ADD CONSTRAINT fk_search_table_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE search_view ADD CONSTRAINT fk_search_view_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE search_view ADD CONSTRAINT fk_search_view_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE search_view_detail ADD CONSTRAINT fk_search_view_det_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE search_view_detail ADD CONSTRAINT fk_search_view_det_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE site ADD CONSTRAINT fk_site_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE site ADD CONSTRAINT fk_site_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE subsystem ADD CONSTRAINT fk_subsystem_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE subsystem ADD CONSTRAINT fk_subsystem_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE SURVEY ADD CONSTRAINT FK_SURVEY_INSERT_BY
    FOREIGN KEY (INSERT_BY, SITE_ID)
    REFERENCES USERS (USER_ID, SITE_ID)
GO

ALTER TABLE SURVEY ADD CONSTRAINT FK_SURVEY_UPDATE_BY
    FOREIGN KEY (UPDATE_BY, SITE_ID)
    REFERENCES USERS (USER_ID, SITE_ID)
GO

ALTER TABLE OWNER_SURVEY_ASSOCIATION ADD CONSTRAINT FK_SURVEY_ASSOC_INSERT_BY
    FOREIGN KEY (INSERT_BY, SITE_ID)
    REFERENCES USERS (USER_ID, SITE_ID)
GO

ALTER TABLE OWNER_SURVEY_ASSOCIATION ADD CONSTRAINT FK_SURVEY_ASSOC_UPDATE_BY
    FOREIGN KEY (UPDATE_BY, SITE_ID)
    REFERENCES USERS (USER_ID, SITE_ID)
GO

ALTER TABLE SURVEY_QUESTION ADD CONSTRAINT FK_SURVEY_QUESTION_INSERT_BY
    FOREIGN KEY (INSERT_BY, SITE_ID)
    REFERENCES USERS (USER_ID, SITE_ID)
GO

ALTER TABLE SURVEY_QUESTION ADD CONSTRAINT FK_SURVEY_QUESTION_UPDATE_BY
    FOREIGN KEY (UPDATE_BY, SITE_ID)
    REFERENCES USERS (USER_ID, SITE_ID)
GO

ALTER TABLE OWNER_QUESTION_RESPONSE ADD CONSTRAINT FK_OWNER_QUEST_RESP_INSERT_BY
    FOREIGN KEY (INSERT_BY, SITE_ID)
    REFERENCES USERS (USER_ID, SITE_ID)
GO

ALTER TABLE OWNER_QUESTION_RESPONSE ADD CONSTRAINT FK_OWNER_QUEST_RESP_UPDATE_BY
    FOREIGN KEY (UPDATE_BY, SITE_ID)
    REFERENCES USERS (USER_ID, SITE_ID)
GO

ALTER TABLE SURVEY_TYPE ADD CONSTRAINT FK_SURVEY_TYPE_INSERT_BY
    FOREIGN KEY (INSERT_BY, SITE_ID)
    REFERENCES USERS (USER_ID, SITE_ID)
GO

ALTER TABLE SURVEY_TYPE ADD CONSTRAINT FK_SURVEY_TYPE_UPDATE_BY
    FOREIGN KEY (UPDATE_BY, SITE_ID)
    REFERENCES USERS (USER_ID, SITE_ID)
GO

ALTER TABLE system_document ADD CONSTRAINT fk_system_document_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE system_document ADD CONSTRAINT fk_system_document_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE system_parameter ADD CONSTRAINT fk_system_parameter_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE system_parameter ADD CONSTRAINT fk_system_parameter_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE table_administration_item ADD CONSTRAINT fk_table_admin_item_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE table_administration_item ADD CONSTRAINT fk_table_admin_item_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE task ADD CONSTRAINT fk_task_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE task ADD CONSTRAINT fk_task_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE task_category ADD CONSTRAINT fk_task_category_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE task_category ADD CONSTRAINT fk_task_category_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE template ADD CONSTRAINT fk_template_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE template ADD CONSTRAINT fk_template_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE template_type ADD CONSTRAINT fk_template_type_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE template_type ADD CONSTRAINT fk_template_type_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE tracking_code ADD CONSTRAINT fk_tracking_code_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE tracking_code ADD CONSTRAINT fk_tracking_code_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE tracking_code_milestone ADD CONSTRAINT fk_track_milestone_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE tracking_code_milestone ADD CONSTRAINT fk_track_milestone_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE tracking_code_type ADD CONSTRAINT fk_track_code_type_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE tracking_code_type ADD CONSTRAINT fk_track_code_type_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE users ADD CONSTRAINT fk_users_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE users ADD CONSTRAINT fk_users_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE user_group ADD CONSTRAINT fk_user_group_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE user_group ADD CONSTRAINT fk_user_group_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE user_preference ADD CONSTRAINT fk_user_preference_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE user_preference ADD CONSTRAINT fk_user_preference_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE user_resource ADD CONSTRAINT fk_user_resource_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE user_resource ADD CONSTRAINT fk_user_resource_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE user_role ADD CONSTRAINT fk_user_role_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE user_role ADD CONSTRAINT fk_user_role_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE work_note_detail ADD CONSTRAINT fk_work_note_detail_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE work_note_detail ADD CONSTRAINT fk_work_note_detail_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE work_note_header ADD CONSTRAINT fk_work_note_header_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE work_note_header ADD CONSTRAINT fk_work_note_header_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE work_ticket
    ADD CONSTRAINT fk_work_ticket_users
    FOREIGN KEY (assigned_to,site_id)
    REFERENCES users (user_id,site_id)
GO

ALTER TABLE work_ticket
    ADD CONSTRAINT fk_work_ticket_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE work_ticket
    ADD CONSTRAINT fk_work_ticket_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE work_ticket_association
    ADD CONSTRAINT fk_work_ticket_assoc_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE work_ticket_association
    ADD CONSTRAINT fk_work_ticket_assoc_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE partner 
    ADD CONSTRAINT fk_partner_user_group
    FOREIGN KEY (group_code, site_id)
    REFERENCES user_group (group_code, site_id)
GO

ALTER TABLE users ADD CONSTRAINT fk_user_group_users
    FOREIGN KEY (group_code,site_id)
    REFERENCES user_group (group_code,site_id)
GO

ALTER TABLE user_group ADD CONSTRAINT fk_user_group_parent
    FOREIGN KEY (parent_user_group_code,site_id)
    REFERENCES user_group (group_code,site_id)
GO

ALTER TABLE user_group_ml ADD CONSTRAINT fk_user_group_ml
    FOREIGN KEY (group_code,site_id)
    REFERENCES user_group (group_code,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE work_note_detail ADD CONSTRAINT fk_work_note_detail_header
    FOREIGN KEY (work_note_header_id)
    REFERENCES work_note_header (work_note_header_id)
GO

ALTER TABLE work_ticket_association
    ADD CONSTRAINT fk_work_ticket_assoc_work_tick
    FOREIGN KEY (work_ticket_id)
    REFERENCES work_ticket (work_ticket_id)
GO

ALTER TABLE script_group
    ADD CONSTRAINT fk_script_group_parent
    FOREIGN KEY (parent_script_group_did,site_id)
    REFERENCES script_group (script_group_did,site_id)
GO

ALTER TABLE script_group_ml
    ADD CONSTRAINT fk_script_group_ml
    FOREIGN KEY (script_group_did, site_id)
    REFERENCES script_group(script_group_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE script_group_ml
    ADD CONSTRAINT fk_script_group_language_ml
    FOREIGN KEY (language_code, site_id)
    REFERENCES language(language_code,site_id)
GO

ALTER TABLE script_group
    ADD CONSTRAINT fk_script_group_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
GO

ALTER TABLE script_group
    ADD CONSTRAINT fk_script_group_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script_group
    ADD CONSTRAINT fk_script_group_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script
    ADD CONSTRAINT fk_script_script_group
    FOREIGN KEY (script_group_did,site_id)
    REFERENCES script_group (script_group_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE script
    ADD CONSTRAINT fk_script_script_step
    FOREIGN KEY (initial_script_step_did,site_id)
    REFERENCES script_step (script_step_did,site_id)
GO

ALTER TABLE script_ml
    ADD CONSTRAINT fk_script_ml
    FOREIGN KEY (script_did, site_id)
    REFERENCES script(script_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE script_ml
    ADD CONSTRAINT fk_script_language_ml
    FOREIGN KEY (language_code, site_id)
    REFERENCES language(language_code,site_id)
GO

ALTER TABLE script
    ADD CONSTRAINT fk_script_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
GO

ALTER TABLE script
    ADD CONSTRAINT fk_script_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script
    ADD CONSTRAINT fk_script_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script_step
    ADD CONSTRAINT fk_script_step_script
    FOREIGN KEY (script_did, site_id)
    REFERENCES script(script_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE script_step
    ADD CONSTRAINT fk_script_step_hdr_script_txt
    FOREIGN KEY (header_script_text_did, site_id)
    REFERENCES script_text(script_text_did,site_id)
GO

ALTER TABLE script_step
    ADD CONSTRAINT fk_script_step_ftr_script_txt
    FOREIGN KEY (footer_script_text_did, site_id)
    REFERENCES script_text(script_text_did,site_id)
GO

ALTER TABLE script_step_ml
    ADD CONSTRAINT fk_script_step_ml
    FOREIGN KEY (script_step_did, site_id)
    REFERENCES script_step(script_step_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE script_step_ml
    ADD CONSTRAINT fk_script_step_language_ml
    FOREIGN KEY (language_code, site_id)
    REFERENCES language(language_code,site_id)
GO

ALTER TABLE script_step
    ADD CONSTRAINT fk_script_step_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
GO

ALTER TABLE script_step
    ADD CONSTRAINT fk_script_step_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script_step
    ADD CONSTRAINT fk_script_step_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script_text_ml
    ADD CONSTRAINT fk_script_text_ml
    FOREIGN KEY (script_text_did, site_id)
    REFERENCES script_text(script_text_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE script_text_ml
    ADD CONSTRAINT fk_script_text_language_ml
    FOREIGN KEY (language_code, site_id)
    REFERENCES language(language_code,site_id)
GO

ALTER TABLE script_text
    ADD CONSTRAINT fk_script_text_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
GO

ALTER TABLE script_text
    ADD CONSTRAINT fk_script_text_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script_text
    ADD CONSTRAINT fk_script_text_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script_prompt
    ADD CONSTRAINT fk_script_prompt_script_step
    FOREIGN KEY (script_step_did, site_id)
    REFERENCES script_step(script_step_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE script_prompt
    ADD CONSTRAINT fk_script_prmt_ctrl_type_code
    FOREIGN KEY (control_type_code, site_id)
    REFERENCES script_control_type(control_type_code,site_id)
GO

ALTER TABLE script_prompt_ml
    ADD CONSTRAINT fk_script_prompt_ml
    FOREIGN KEY (script_prompt_did, site_id)
    REFERENCES script_prompt(script_prompt_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE script_prompt_ml
    ADD CONSTRAINT fk_script_prompt_language_ml
    FOREIGN KEY (language_code, site_id)
    REFERENCES language(language_code,site_id)
GO

ALTER TABLE script_prompt
    ADD CONSTRAINT fk_script_prompt_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
GO

ALTER TABLE script_prompt
    ADD CONSTRAINT fk_script_prompt_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script_prompt
    ADD CONSTRAINT fk_script_prompt_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script_prompt_response
    ADD CONSTRAINT fk_scr_prmt_resp_scr_prmt
    FOREIGN KEY (script_prompt_did, site_id)
    REFERENCES script_prompt(script_prompt_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE script_prompt_response_ml
    ADD CONSTRAINT fk_script_prompt_response_ml
    FOREIGN KEY (script_prompt_did, script_prompt_response_code,site_id)
    REFERENCES script_prompt_response(script_prompt_did,script_prompt_response_code,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE script_prompt_response_ml
    ADD CONSTRAINT fk_scr_prmt_resp_language_ml
    FOREIGN KEY (language_code, site_id)
    REFERENCES language(language_code,site_id)
GO

ALTER TABLE script_prompt_response
    ADD CONSTRAINT fk_scr_prmt_resp_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
GO

ALTER TABLE script_prompt_response
    ADD CONSTRAINT fk_scr_prmt_resp_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script_prompt_response
    ADD CONSTRAINT fk_scr_prmt_resp_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script_rule
    ADD CONSTRAINT fk_script_rule_script_step
    FOREIGN KEY (script_step_did, site_id)
    REFERENCES script_step(script_step_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE script_rule_ml
    ADD CONSTRAINT fk_script_rule_ml
    FOREIGN KEY (script_rule_did,site_id)
    REFERENCES script_rule(script_rule_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE script_rule_ml
    ADD CONSTRAINT fk_script_rule_language_ml
    FOREIGN KEY (language_code, site_id)
    REFERENCES language(language_code,site_id)
GO

ALTER TABLE script_rule
    ADD CONSTRAINT fk_script_rule_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
GO

ALTER TABLE script_rule
    ADD CONSTRAINT fk_script_rule_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script_rule
    ADD CONSTRAINT fk_script_rule_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE method_call_ml
    ADD CONSTRAINT fk_method_call_ml
    FOREIGN KEY (method_call_did,site_id)
    REFERENCES method_call(method_call_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE method_call_ml
    ADD CONSTRAINT fk_method_call_language_ml
    FOREIGN KEY (language_code, site_id)
    REFERENCES language(language_code,site_id)
GO

ALTER TABLE method_call
    ADD CONSTRAINT fk_method_call_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
GO

ALTER TABLE method_call
    ADD CONSTRAINT fk_method_call_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE method_call
    ADD CONSTRAINT fk_method_call_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE method_call_detail
    ADD CONSTRAINT fk_meth_call_det_meth_call
    FOREIGN KEY (method_call_did,site_id)
    REFERENCES method_call(method_call_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE method_call_detail_ml
    ADD CONSTRAINT fk_method_call_det_ml
    FOREIGN KEY (method_call_detail_did,site_id)
    REFERENCES method_call_detail(method_call_detail_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE method_call_detail_ml
    ADD CONSTRAINT fk_method_call_det_language_ml
    FOREIGN KEY (language_code, site_id)
    REFERENCES language(language_code,site_id)
GO

ALTER TABLE method_call_detail
    ADD CONSTRAINT fk_method_call_det_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
GO

ALTER TABLE method_call_detail
    ADD CONSTRAINT fk_method_call_det_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE method_call_detail
    ADD CONSTRAINT fk_method_call_det_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users(user_id,site_id)
    
GO

ALTER TABLE script_step_method_call
    ADD CONSTRAINT fk_scr_step_m_call_script_step
    FOREIGN KEY (script_step_did,site_id)
    REFERENCES script_step(script_step_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE script_step_method_call
    ADD CONSTRAINT fk_scr_step_m_call_meth_call
    FOREIGN KEY (method_call_did,site_id)
    REFERENCES method_call(method_call_did,site_id)
GO

ALTER TABLE script_step_method_call
    ADD CONSTRAINT fk_scr_step_m_call_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
GO

ALTER TABLE script_step_method_call
    ADD CONSTRAINT fk_scr_step_m_call_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script_step_method_call
    ADD CONSTRAINT fk_scr_step_m_call_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script_step_method_call_detail
    ADD CONSTRAINT fk_ssmethoddetail_ssmethcall
    FOREIGN KEY (script_step_method_call_did, site_id)
    REFERENCES script_step_method_call(script_step_method_call_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE script_step_method_call_detail
    ADD CONSTRAINT fk_ssmethoddetail_methcalldet
    FOREIGN KEY (method_call_detail_did, site_id)
    REFERENCES method_call_detail(method_call_detail_did,site_id)
GO

ALTER TABLE script_step_method_call_detail
    ADD CONSTRAINT fk_ssmethoddetail_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
GO

ALTER TABLE script_step_method_call_detail
    ADD CONSTRAINT fk_ssmethoddetail_insert_by
    FOREIGN KEY (insert_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script_step_method_call_detail
    ADD CONSTRAINT fk_ssmethoddetail_update_by
    FOREIGN KEY (update_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script_variable
    ADD CONSTRAINT fk_script_var_script
    FOREIGN KEY (script_did,site_id)
    REFERENCES script(script_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE script_variable
    ADD CONSTRAINT fk_script_var_script_step
    FOREIGN KEY (script_step_did,site_id)
    REFERENCES script_step(script_step_did,site_id)
GO

ALTER TABLE script_variable_ml
    ADD CONSTRAINT fk_script_var_ml
    FOREIGN KEY (script_variable_did,site_id)
    REFERENCES script_variable(script_variable_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE script_variable_ml
    ADD CONSTRAINT fk_script_var_language_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language(language_code,site_id)
GO

ALTER TABLE script_variable
    ADD CONSTRAINT fk_script_var_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
GO

ALTER TABLE script_variable
    ADD CONSTRAINT fk_script_var_insert_by
    FOREIGN KEY (insert_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script_variable
    ADD CONSTRAINT fk_script_var_update_by
    FOREIGN KEY (update_by,site_id)
    REFERENCES users(user_id,site_id)
	GO

ALTER TABLE script_control_type_ml
    ADD CONSTRAINT fk_script_ctrl_type_ml
    FOREIGN KEY (control_type_code,site_id)
    REFERENCES script_control_type(control_type_code,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE script_control_type_ml
    ADD CONSTRAINT fk_script_ctrl_type_lang_ml
    FOREIGN KEY (language_code,site_id)
    REFERENCES language(language_code,site_id)
GO

ALTER TABLE script_control_type
    ADD CONSTRAINT fk_script_ctrl_type_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
GO

ALTER TABLE script_control_type
    ADD CONSTRAINT fk_script_ctrl_type_insert_by
    FOREIGN KEY (insert_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script_control_type
    ADD CONSTRAINT fk_script_ctrl_type_update_by
    FOREIGN KEY (update_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE server_connection
    ADD CONSTRAINT fk_server_conn_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
GO

ALTER TABLE server_connection
    ADD CONSTRAINT fk_server_conn_insert_by
    FOREIGN KEY (insert_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE server_connection
    ADD CONSTRAINT fk_server_conn_update_by
    FOREIGN KEY (update_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script_session
    ADD CONSTRAINT fk_script_session_script
    FOREIGN KEY (script_did,site_id)
    REFERENCES script(script_did,site_id)
GO

ALTER TABLE script_session
    ADD CONSTRAINT fk_script_session_assigned_to
    FOREIGN KEY (assigned_to,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script_session
    ADD CONSTRAINT fk_script_session_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
GO

ALTER TABLE script_session
    ADD CONSTRAINT fk_script_session_insert_by
    FOREIGN KEY (insert_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script_session
    ADD CONSTRAINT fk_script_session_update_by
    FOREIGN KEY (update_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script_session_step
    ADD CONSTRAINT fk_scr_sess_step_scr_sess
    FOREIGN KEY (script_session_id)
    REFERENCES script_session(script_session_id)
GO

ALTER TABLE script_session_step
    ADD CONSTRAINT fk_scr_sess_step_scr_step
    FOREIGN KEY (script_step_did,site_id)
    REFERENCES script_step(script_step_did,site_id)
GO

ALTER TABLE script_session_step
    ADD CONSTRAINT fk_scr_sess_step_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
GO

ALTER TABLE script_session_step
    ADD CONSTRAINT fk_scr_sess_step_insert_by
    FOREIGN KEY (insert_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script_session_step
    ADD CONSTRAINT fk_scr_sess_step_update_by
    FOREIGN KEY (update_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script_session_prompt_response
    ADD CONSTRAINT fk_sspromptres_ssstep
    FOREIGN KEY (script_session_step_id)
    REFERENCES script_session_step(script_session_step_id)
    
GO

ALTER TABLE script_session_prompt_response
    ADD CONSTRAINT fk_sspromptres_scriptprompt
    FOREIGN KEY (script_prompt_did,site_id)
    REFERENCES script_prompt(script_prompt_did,site_id)
GO

ALTER TABLE script_session_prompt_response
    ADD CONSTRAINT fk_sspromptres_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
GO

ALTER TABLE script_session_prompt_response
    ADD CONSTRAINT fk_sspromptres_insert_by
    FOREIGN KEY (insert_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE script_session_prompt_response
    ADD CONSTRAINT fk_sspromptres_update_by
    FOREIGN KEY (update_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE email_address_book_item_ml
    ADD CONSTRAINT fk_email_address_book_item_ml
    FOREIGN KEY (email_address_book_item_did,
                 site_id)
    REFERENCES email_address_book_item (email_address_book_item_did,
                                        site_id)
    ON DELETE CASCADE
GO

ALTER TABLE email_user_association
    ADD CONSTRAINT fk_email_user_assoc_type
    FOREIGN KEY (email_association_type_code, 
                 associated_with_type_enum,
                 site_id)
    REFERENCES email_association_type (email_association_type_code,
                                       association_object_type_enum,
                                       site_id)
GO

ALTER TABLE email_association
    ADD CONSTRAINT fk_email_assoc_type
    FOREIGN KEY (email_association_type_code,
                 associated_with_type_enum,
                 site_id)
    REFERENCES email_association_type (email_association_type_code,
                                       association_object_type_enum,
                                       site_id)   
GO

ALTER TABLE email_association_type_ml
    ADD CONSTRAINT fk_email_assoc_type_ml
    FOREIGN KEY (email_association_type_code,
                 association_object_type_enum,
                 site_id)
    REFERENCES email_association_type (email_association_type_code,
                                       association_object_type_enum,
                                       site_id)
    ON DELETE CASCADE
GO

ALTER TABLE email_user_association
    ADD CONSTRAINT fk_email_user_assoc_email_cnt
    FOREIGN KEY (email_contact_id)
    REFERENCES email_contact (email_contact_id)
GO

ALTER TABLE email_association
    ADD CONSTRAINT fk_email_assoc_email_cnt
    FOREIGN KEY (email_contact_id)
    REFERENCES email_contact (email_contact_id)
    
GO

ALTER TABLE email_contact
    ADD CONSTRAINT fk_email_contact_contact_type
    FOREIGN KEY (email_contact_type_did, site_id)
    REFERENCES email_contact_type (email_contact_type_did, site_id)
GO

ALTER TABLE email_contact_type_ml
    ADD CONSTRAINT fk_email_contact_type_ml
    FOREIGN KEY (email_contact_type_did, site_id)
    REFERENCES email_contact_type (email_contact_type_did, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE email_user_association
    ADD CONSTRAINT fk_email_user_assoc_email_msg
    FOREIGN KEY (email_message_id)
    REFERENCES email_message (email_message_id)
GO

ALTER TABLE email_association
    ADD CONSTRAINT fk_email_assoc_email_msg
    FOREIGN KEY (email_message_id)
    REFERENCES email_message (email_message_id)
GO

ALTER TABLE email_attachment
    ADD CONSTRAINT fk_email_attachment_email_msg
    FOREIGN KEY (email_message_id)
    REFERENCES email_message (email_message_id)
GO

ALTER TABLE email_contact
    ADD CONSTRAINT fk_email_contact_email_msg
    FOREIGN KEY (email_message_id)
    REFERENCES email_message (email_message_id)
GO

ALTER TABLE email_monitor_mailbox_ml
    ADD CONSTRAINT fk_email_mntr_mlbx_ml
    FOREIGN KEY (email_monitor_mailbox_did, site_id)
    REFERENCES email_monitor_mailbox (email_monitor_mailbox_did, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE email_monitor_mailbox
    ADD CONSTRAINT fk_email_mntr_mlbx_file_loc
    FOREIGN KEY (file_location_did, site_id)
    REFERENCES file_location (file_location_did, site_id)
                    GO

ALTER TABLE email_address_book_item_ml
    ADD CONSTRAINT fk_email_addr_book_lang_ml
    FOREIGN KEY (language_code, site_id)
    REFERENCES language (language_code, site_id)
GO

ALTER TABLE email_association_type_ml
    ADD CONSTRAINT fk_email_assoc_type_lang_ml
    FOREIGN KEY (language_code, site_id)
    REFERENCES language (language_code, site_id)
GO

ALTER TABLE email_contact_type_ml
    ADD CONSTRAINT fk_email_contact_type_lang_ml
    FOREIGN KEY (language_code, site_id)
    REFERENCES language (language_code, site_id)
GO

ALTER TABLE email_monitor_mailbox_ml
    ADD CONSTRAINT fk_email_mntr_mlbx_lang_ml
    FOREIGN KEY (language_code, site_id)
    REFERENCES language (language_code, site_id)
GO

ALTER TABLE merge_template_group_ml
    ADD CONSTRAINT fk_mrg_template_group_lang_ml
    FOREIGN KEY (language_code, site_id)
    REFERENCES language (language_code, site_id)
GO

ALTER TABLE relative_date_ml
    ADD CONSTRAINT fk_relative_date_lang_ml
    FOREIGN KEY (language_code, site_id)
    REFERENCES language (language_code, site_id)
GO

ALTER TABLE merge_template
    ADD CONSTRAINT fk_mrg_template_mrg_group
    FOREIGN KEY (merge_template_group_did, site_id)
    REFERENCES merge_template_group (merge_template_group_did, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE merge_template_group
    ADD CONSTRAINT fk_mrg_template_group_parent
    FOREIGN KEY (prnt_merge_template_group_did, site_id)
    REFERENCES merge_template_group (merge_template_group_did, site_id)
GO

ALTER TABLE merge_template_group_ml
    ADD CONSTRAINT fk_mrg_template_group_ml
    FOREIGN KEY (merge_template_group_did, site_id)
    REFERENCES merge_template_group (merge_template_group_did, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE merge_template
    ADD CONSTRAINT fk_mrg_template_method_call
    FOREIGN KEY (method_call_did, site_id)
    REFERENCES method_call (method_call_did, site_id)
GO

ALTER TABLE merge_template
    ADD CONSTRAINT fk_mrg_template_txt_frmt_ref
    FOREIGN KEY (text_format_type_did, site_id)
    REFERENCES reference_parameter (reference_parameter_did, site_id)
GO

ALTER TABLE email_address_book_item
    ADD CONSTRAINT fk_email_addr_book_item_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE email_association
    ADD CONSTRAINT fk_email_assoc_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE email_association_type
    ADD CONSTRAINT fk_email_association_type_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE email_attachment
    ADD CONSTRAINT fk_email_attachment_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE email_contact
    ADD CONSTRAINT fk_email_contact_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE email_contact_type
    ADD CONSTRAINT fk_email_contact_type_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE email_message
    ADD CONSTRAINT fk_email_message_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE email_monitor_mailbox
    ADD CONSTRAINT fk_email_mntr_mlbx_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE email_user_association
    ADD CONSTRAINT fk_email_user_assoc_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE merge_template
    ADD CONSTRAINT fk_merge_template_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE merge_template_group
    ADD CONSTRAINT fk_merge_template_group_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE relative_date
    ADD CONSTRAINT fk_relative_date_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE relative_date_ml
    ADD CONSTRAINT fk_relative_date_ml
    FOREIGN KEY (relative_date_did, site_id)
    REFERENCES relative_date (relative_date_did, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE email_monitor_mailbox 
    ADD CONSTRAINT fk_email_mntr_mlbx_subsystem
    FOREIGN KEY (subsystem_did, site_id)
    REFERENCES subsystem (subsystem_did, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE email_user_association 
    ADD CONSTRAINT fk_email_user_assoc_users
    FOREIGN KEY (user_id, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE email_monitor_mailbox 
    ADD CONSTRAINT fk_email_mntr_mlbx_users
    FOREIGN KEY (user_to_impersonate, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE partner_user 
    ADD CONSTRAINT fk_partner_user_user
    FOREIGN KEY (user_id, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE user_access 
    ADD CONSTRAINT fk_user_access_user 
    FOREIGN KEY (user_id, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE user_customer_association 
    ADD CONSTRAINT fk_user_customer_assoc_user  
    FOREIGN KEY (user_id, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE user_partner_group 
    ADD CONSTRAINT fk_user_partner_group_user  
    FOREIGN KEY (user_id, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE external_user
    ADD CONSTRAINT fk_external_user_user
    FOREIGN KEY (access_user_id, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE partner 
    ADD CONSTRAINT fk_partner_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE partner 
    ADD CONSTRAINT fk_partner_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE email_address_book_item
    ADD CONSTRAINT fk_email_addr_book_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE email_address_book_item
    ADD CONSTRAINT fk_email_addr_book_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE email_association
    ADD CONSTRAINT fk_email_assoc_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE email_association
    ADD CONSTRAINT fk_email_assoc_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE email_association_type
    ADD CONSTRAINT fk_email_assoc_type_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE email_association_type
    ADD CONSTRAINT fk_email_assoc_type_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE email_attachment
    ADD CONSTRAINT fk_email_attachment_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE email_attachment
    ADD CONSTRAINT fk_email_attachment_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE email_contact
    ADD CONSTRAINT fk_email_contact_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE email_contact
    ADD CONSTRAINT fk_email_contact_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE email_contact_type
    ADD CONSTRAINT fk_email_cont_type_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE email_contact_type
    ADD CONSTRAINT fk_email_cont_type_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE email_message
    ADD CONSTRAINT fk_email_message_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE email_message
    ADD CONSTRAINT fk_email_message_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE email_monitor_mailbox
    ADD CONSTRAINT fk_email_mntr_mlbx_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE email_monitor_mailbox
    ADD CONSTRAINT fk_email_mntr_mlbx_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE email_user_association
    ADD CONSTRAINT fk_email_user_assoc_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE email_user_association
    ADD CONSTRAINT fk_email_user_assoc_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE merge_template
    ADD CONSTRAINT fk_merge_template_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE merge_template
    ADD CONSTRAINT fk_merge_template_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE merge_template_group
    ADD CONSTRAINT fk_mrg_template_group_insrt_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE merge_template_group
    ADD CONSTRAINT fk_mrg_template_group_updt_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE relative_date
    ADD CONSTRAINT fk_relative_date_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE relative_date
    ADD CONSTRAINT fk_relative_date_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE script_rule
   ADD CONSTRAINT fk_script_rule_dst_script_step
   FOREIGN KEY (destination_script_step_did, site_id) 
   REFERENCES script_step (script_step_did, site_id)
GO

ALTER TABLE partner_access 
    ADD CONSTRAINT fk_partner_access_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE partner_access 
    ADD CONSTRAINT fk_partner_access_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE partner_group 
    ADD CONSTRAINT fk_partner_group_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE partner_group 
    ADD CONSTRAINT fk_partner_group_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE partner_group_access 
    ADD CONSTRAINT fk_partner_group_acc_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE partner_group_access 
    ADD CONSTRAINT fk_partner_group_acc_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE partner_user 
    ADD CONSTRAINT fk_partner_user_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE partner_user 
    ADD CONSTRAINT fk_partner_user_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE user_access 
    ADD CONSTRAINT fk_user_access_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE user_access 
    ADD CONSTRAINT fk_user_access_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE user_customer_association 
    ADD CONSTRAINT fk_user_cust_assoc_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE user_customer_association 
    ADD CONSTRAINT fk_user_cust_assoc_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE user_partner_group 
    ADD CONSTRAINT fk_user_prtnr_group_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE user_partner_group 
    ADD CONSTRAINT fk_user_prtnr_group_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE external_user
    ADD CONSTRAINT fk_external_user_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE external_user
    ADD CONSTRAINT fk_external_user_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE external_literature_group
    ADD CONSTRAINT fk_external_lit_group_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE external_literature_group
    ADD CONSTRAINT fk_external_lit_group_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO
    
ALTER TABLE partner_access 
    ADD CONSTRAINT fk_partner_access_partner
    FOREIGN KEY (partner_id)
    REFERENCES partner (partner_id)
GO

ALTER TABLE partner_group 
    ADD CONSTRAINT fk_partner_group_partner
    FOREIGN KEY (partner_id)
    REFERENCES partner (partner_id)
GO

ALTER TABLE partner_user 
    ADD CONSTRAINT fk_partner_user_partner
    FOREIGN KEY (partner_id)
    REFERENCES partner (partner_id)
GO

ALTER TABLE partner_group_access 
    ADD CONSTRAINT fk_prtnr_group_acc_prtnr_acc 
    FOREIGN KEY (partner_access_id)
    REFERENCES partner_access (partner_access_id)
GO

ALTER TABLE user_access 
    ADD CONSTRAINT fk_user_access_prtnr_access 
    FOREIGN KEY (partner_access_id)
    REFERENCES partner_access (partner_access_id)
GO

ALTER TABLE partner_group 
    ADD CONSTRAINT fk_partner_group_parent
    FOREIGN KEY (parent_partner_group_id)
    REFERENCES partner_group (partner_group_id)
GO

ALTER TABLE partner_group_access 
    ADD CONSTRAINT fk_prtnr_grp_acc_prtnr_grp
    FOREIGN KEY (partner_group_id)
    REFERENCES partner_group (partner_group_id)
GO

ALTER TABLE user_partner_group 
    ADD CONSTRAINT fk_user_prtnr_grp_prtnr_grp
    FOREIGN KEY (partner_group_id)
    REFERENCES partner_group (partner_group_id)
GO

ALTER TABLE external_literature_group_ml
    ADD CONSTRAINT fk_external_lit_group_ml
    FOREIGN KEY (external_literature_group_did, site_id)
    REFERENCES external_literature_group (external_literature_group_did, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE literature_product
    ADD CONSTRAINT fk_lit_product_external_group
    FOREIGN KEY (external_literature_group_did, site_id)
    REFERENCES external_literature_group (external_literature_group_did, site_id)
GO

-- Foreign keys to subscription_service table
ALTER TABLE subscription_service
    ADD CONSTRAINT fk_subsc_service_insert_by
    FOREIGN KEY (insert_by,site_id)
    REFERENCES users (user_id, site_id)

GO

ALTER TABLE subscription_service
    ADD CONSTRAINT fk_subsc_service_update_by
    FOREIGN KEY (update_by,site_id)
    REFERENCES users (user_id,site_id)

GO

ALTER TABLE subscription_service_ml
   ADD CONSTRAINT fk_subsc_service_ml_serv_id
   FOREIGN KEY (subscription_service_did, site_id)
   REFERENCES subscription_service (subscription_service_did, site_id)
   ON DELETE CASCADE
GO

ALTER TABLE subscription_service_ml
   ADD CONSTRAINT fk_subsc_service_ml_language
   FOREIGN KEY (language_code, site_id)
   REFERENCES language (language_code, site_id)

GO

-- Foreign keys to staging_server table
ALTER TABLE staging_server
    ADD CONSTRAINT fk_stag_server_insert_by
    FOREIGN KEY (insert_by,site_id)
    REFERENCES users (user_id,site_id)

GO

ALTER TABLE staging_server
    ADD CONSTRAINT fk_stag_server_update_by
    FOREIGN KEY (update_by,site_id)
    REFERENCES users (user_id,site_id)

GO

-- Foreign keys to subscribable_object table
ALTER TABLE subscribable_object
    ADD CONSTRAINT fk_subsc_object_insert_by
    FOREIGN KEY (insert_by,site_id)
    REFERENCES users (user_id,site_id)

GO

ALTER TABLE subscribable_object
    ADD CONSTRAINT fk_subsc_object_update_by
    FOREIGN KEY (update_by,site_id)
    REFERENCES users (user_id,site_id)

GO

ALTER TABLE subscribable_object
    ADD CONSTRAINT fk_subsc_object_object_type_enum
    FOREIGN KEY (object_type_enum)
    REFERENCES oed_object_map (object_type_enum)

GO

ALTER TABLE subscribable_object
    ADD CONSTRAINT fk_subsc_object_service_did
    FOREIGN KEY (subscription_service_did,site_id)
    REFERENCES subscription_service (subscription_service_did,site_id)
    ON DELETE CASCADE
GO

-- Foreign keys to subsc_relationship table
ALTER TABLE subsc_relationship
    ADD CONSTRAINT fk_subsc_relat_insert_by
    FOREIGN KEY (insert_by,site_id)
    REFERENCES users (user_id,site_id)

GO

ALTER TABLE subsc_relationship
    ADD CONSTRAINT fk_subsc_relat_update_by
    FOREIGN KEY (update_by,site_id)
    REFERENCES users (user_id,site_id)

GO

ALTER TABLE subsc_relationship
    ADD CONSTRAINT fk_subsc_relat_oed_relat_id
    FOREIGN KEY (oed_relationship_map_id,primary_object_type_enum,secondary_object_type_enum)
    REFERENCES oed_relationship_map (relationship_id,parent_type_enum,child_type_enum)

GO

ALTER TABLE subsc_relationship
    ADD CONSTRAINT fk_subsc_relat_secondary_object_type_enum
    FOREIGN KEY (secondary_object_type_enum,subscription_service_did,site_id)
    REFERENCES subscribable_object (object_type_enum,subscription_service_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE subsc_relationship
    ADD CONSTRAINT fk_subsc_relat_primary_object_type_enum
    FOREIGN KEY (primary_object_type_enum,subscription_service_did,site_id)
    REFERENCES subscribable_object (object_type_enum,subscription_service_did,site_id)
GO

ALTER TABLE subsc_relationship_ml
    ADD CONSTRAINT fk_subsc_relationship_ml_subsc_relationship
    FOREIGN KEY (subsc_relationship_did,site_id)
    REFERENCES subsc_relationship (subsc_relationship_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE subsc_relationship_ml
    ADD CONSTRAINT fk_subsc_relationship_ml_language
    FOREIGN KEY ( language_code, site_id)
    REFERENCES language ( language_code, site_id)
GO


-- Foreign keys to subsc_relationship_role table
ALTER TABLE subsc_relationship_role
    ADD CONSTRAINT fk_subsc_relat_role_insert_by
    FOREIGN KEY (insert_by,site_id)
    REFERENCES users (user_id,site_id)

GO

ALTER TABLE subsc_relationship_role
    ADD CONSTRAINT fk_subsc_relat_role_update_by
    FOREIGN KEY (update_by,site_id)
    REFERENCES users (user_id,site_id)

GO

ALTER TABLE subsc_relationship_role
    ADD CONSTRAINT fk_subsc_relat_role_role_name
    FOREIGN KEY (role_name,site_id)
    REFERENCES role (role_name,site_id)

GO

ALTER TABLE subsc_relationship_role
    ADD CONSTRAINT fk_subsc_relat_role_relat_id
    FOREIGN KEY (subsc_relationship_did,site_id)
    REFERENCES subsc_relationship (subsc_relationship_did,site_id)
    ON DELETE CASCADE

GO

ALTER TABLE subsc_relationship_role_ml
    ADD CONSTRAINT fk_subsc_relationship_role_ml_subsc_relationship_role
    FOREIGN KEY (subsc_relationship_role_did,site_id)
    REFERENCES subsc_relationship_role (subsc_relationship_role_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE subsc_relationship_role_ml
    ADD CONSTRAINT fk_subsc_relationship_role_ml_language
    FOREIGN KEY ( language_code, site_id)
    REFERENCES language ( language_code, site_id)
GO

-- Foreign keys to subscription_profile table
ALTER TABLE subscription_profile
    ADD CONSTRAINT fk_subsc_profile_insert_by
    FOREIGN KEY (insert_by,site_id)
    REFERENCES users (user_id,site_id)

GO

ALTER TABLE subscription_profile
    ADD CONSTRAINT fk_subsc_profile_update_by
    FOREIGN KEY (update_by,site_id)
    REFERENCES users (user_id,site_id)

GO

ALTER TABLE subscription_profile
    ADD CONSTRAINT fk_subsc_profile_server_id
    FOREIGN KEY (staging_server_did,site_id)
    REFERENCES staging_server (staging_server_did,site_id)

GO

ALTER TABLE subscription_profile
    ADD CONSTRAINT fk_subsc_profile_service_id
    FOREIGN KEY (subscription_service_did,site_id)
    REFERENCES subscription_service (subscription_service_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE subscription_profile
    ADD CONSTRAINT fk_subsc_profile_subsystem_id
    FOREIGN KEY (subsystem_did,site_id)
    REFERENCES subsystem (subsystem_did,site_id)

GO

ALTER TABLE subscription_profile
    ADD CONSTRAINT fk_subsc_profile_user_id
    FOREIGN KEY (user_id,site_id)
    REFERENCES users (user_id,site_id)
    ON DELETE CASCADE
GO


-- Foreign keys to subscription_item table
ALTER TABLE subscription_item
    ADD CONSTRAINT fk_subsc_item_insert_by
    FOREIGN KEY (insert_by,site_id)
    REFERENCES users (user_id,site_id)

GO

ALTER TABLE subscription_item
    ADD CONSTRAINT fk_subsc_item_update_by
    FOREIGN KEY (update_by,site_id)
    REFERENCES users (user_id,site_id)

GO

ALTER TABLE subscription_item
    ADD CONSTRAINT fk_subsc_item_object_type_enum
    FOREIGN KEY (object_type_enum,subscription_service_did,site_id)
    REFERENCES subscribable_object (object_type_enum,subscription_service_did,site_id)

GO

ALTER TABLE subscription_item
    ADD CONSTRAINT fk_subsc_item_profile
    FOREIGN KEY (subscription_user_id,subscription_service_did,site_id)
    REFERENCES subscription_profile (user_id,subscription_service_did,site_id)

GO


-- Foreign keys to subscription_id_map table
ALTER TABLE subscription_id_map
    ADD CONSTRAINT fk_subsc_id_map_insert_by
    FOREIGN KEY (insert_by,site_id)
    REFERENCES users (user_id,site_id)

GO

ALTER TABLE subscription_id_map
    ADD CONSTRAINT fk_subsc_id_map_update_by
    FOREIGN KEY (update_by,site_id)
    REFERENCES users (user_id,site_id)

GO

ALTER TABLE subscription_id_map
    ADD CONSTRAINT fk_subsc_id_map_profile
    FOREIGN KEY (subscription_user_id,subscription_service_did,site_id)
    REFERENCES subscription_profile (user_id,subscription_service_did,site_id)

GO

-- Foreign keys to publishable_object table
ALTER TABLE publishable_object
    ADD CONSTRAINT fk_publish_obj_insert_by
    FOREIGN KEY (insert_by,site_id)
    REFERENCES users (user_id,site_id)
GO

ALTER TABLE publishable_object
    ADD CONSTRAINT fk_publish_obj_update_by
    FOREIGN KEY (update_by,site_id)
    REFERENCES users (user_id,site_id)

GO

ALTER TABLE publishable_object_ml
    ADD CONSTRAINT fk_publishable_object_ml_publishable_object
    FOREIGN KEY (publishable_object_did,site_id)
    REFERENCES publishable_object (publishable_object_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE publishable_object_ml
    ADD CONSTRAINT fk_publishable_object_ml_language
    FOREIGN KEY ( language_code, site_id)
    REFERENCES language ( language_code, site_id)
GO

-- FK's to OED tables
ALTER TABLE oed_relationship_map 
        ADD CONSTRAINT fk_oed_object_parent
            FOREIGN KEY (parent_type_enum)
            REFERENCES oed_object_map (object_type_enum)  
GO

ALTER TABLE oed_relationship_map 
        ADD CONSTRAINT fk_oed_object_child
            FOREIGN KEY (child_type_enum)
            REFERENCES oed_object_map (object_type_enum)
GO


-- Foreign Keys to Oaktree Territory Manager Tables

ALTER TABLE assignment_association
    ADD CONSTRAINT fk_assignment_association_assignment_territory
    FOREIGN KEY (assignment_territory_did, site_id)
    REFERENCES assignment_territory(assignment_territory_did, site_id)
GO

ALTER TABLE assignment_association
    ADD CONSTRAINT fk_assignment_association_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
GO

ALTER TABLE assignment_association
    ADD CONSTRAINT fk_assignment_association_insert_by
    FOREIGN KEY (insert_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE assignment_association
    ADD CONSTRAINT fk_assignment_association_update_by
    FOREIGN KEY (update_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE assignment_condition
    ADD CONSTRAINT fk_assignment_condition_assignment_territory
    FOREIGN KEY (assignment_territory_did,site_id)
    REFERENCES assignment_territory(assignment_territory_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE assignment_condition
    ADD CONSTRAINT fk_assignment_condition_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
GO

ALTER TABLE assignment_condition
    ADD CONSTRAINT fk_assignment_condition_insert_by
    FOREIGN KEY (insert_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE assignment_condition
    ADD CONSTRAINT fk_assignment_condition_update_by
    FOREIGN KEY (update_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE assignment_condition_ml
    ADD CONSTRAINT fk_assignment_cond_ml_assignment_cond
    FOREIGN KEY (assignment_condition_did,site_id)
    REFERENCES assignment_condition (assignment_condition_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE assignment_condition_ml
    ADD CONSTRAINT fk_assignment_cond_ml_language
    FOREIGN KEY ( language_code, site_id)
    REFERENCES language ( language_code, site_id)
GO

ALTER TABLE assignment_expression
    ADD CONSTRAINT fk_assignment_expression_assignment_condition
    FOREIGN KEY (assignment_condition_did,site_id)
    REFERENCES assignment_condition(assignment_condition_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE assignment_expression
    ADD CONSTRAINT fk_assignment_expression_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
GO

ALTER TABLE assignment_expression
    ADD CONSTRAINT fk_assignment_expression_insert_by
    FOREIGN KEY (insert_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE assignment_expression
    ADD CONSTRAINT fk_assignment_expression_update_by
    FOREIGN KEY (update_by,site_id)
    REFERENCES users(user_id,site_id)
GO     

ALTER TABLE assignment_territory
    ADD CONSTRAINT fk_assignment_territory_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
GO

ALTER TABLE assignment_territory
    ADD CONSTRAINT fk_assignment_territory_insert_by
    FOREIGN KEY (insert_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE assignment_territory
    ADD CONSTRAINT fk_assignment_territory_update_by
    FOREIGN KEY (update_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE assignment_territory
    ADD CONSTRAINT fk_assignment_territory_parent_territory
    FOREIGN KEY (parent_assignment_territory_did, site_id)
    REFERENCES assignment_territory (assignment_territory_did, site_id)
GO

ALTER TABLE assignment_territory_ml
    ADD CONSTRAINT fk_assignment_territory_ml_assignment_territory
    FOREIGN KEY (assignment_territory_did,site_id)
    REFERENCES assignment_territory (assignment_territory_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE assignment_territory_ml
    ADD CONSTRAINT fk_assignment_territory_ml_language
    FOREIGN KEY ( language_code, site_id)
    REFERENCES language ( language_code, site_id)
GO

ALTER TABLE assignment_set
    ADD CONSTRAINT fk_assignment_set_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
GO

ALTER TABLE assignment_set
    ADD CONSTRAINT fk_assignment_set_insert_by
    FOREIGN KEY (insert_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE assignment_set
    ADD CONSTRAINT fk_assignment_set_update_by
    FOREIGN KEY (update_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE assignment_set_ml
    ADD CONSTRAINT fk_assignment_set_ml_assignment_set
    FOREIGN KEY (assignment_set_did,site_id)
    REFERENCES assignment_set (assignment_set_did,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE assignment_set_ml
    ADD CONSTRAINT fk_assignment_set_ml_language
    FOREIGN KEY ( language_code, site_id)
    REFERENCES language ( language_code, site_id)
GO

ALTER TABLE assignment_set_condition
    ADD CONSTRAINT fk_assignment_set_condition_assignment_condition
    FOREIGN KEY (assignment_condition_did, site_id)
    REFERENCES assignment_condition(assignment_condition_did, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE assignment_set_condition
    ADD CONSTRAINT fk_assignment_set_condition_assignment_set
    FOREIGN KEY (assignment_set_did, site_id)
    REFERENCES assignment_set(assignment_set_did, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE assignment_set_condition
    ADD CONSTRAINT fk_assignment_set_condition_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
GO

ALTER TABLE assignment_set_condition
    ADD CONSTRAINT fk_assignment_set_condition_insert_by
    FOREIGN KEY (insert_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE assignment_set_condition
    ADD CONSTRAINT fk_assignment_set_condition_update_by
    FOREIGN KEY (update_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE assignment_set_user
    ADD CONSTRAINT fk_assignment_set_user_assignment_set
    FOREIGN KEY (assignment_set_did, site_id)
    REFERENCES assignment_set(assignment_set_did, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE assignment_set_user
    ADD CONSTRAINT fk_assignment_set_user_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
GO

ALTER TABLE assignment_set_user
    ADD CONSTRAINT fk_assignment_set_user_insert_by
    FOREIGN KEY (insert_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE assignment_set_user
    ADD CONSTRAINT fk_assignment_set_user_update_by
    FOREIGN KEY (update_by,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE assignment_set_user
    ADD CONSTRAINT fk_assignment_set_user_user_id
    FOREIGN KEY (user_id,site_id)
    REFERENCES users(user_id,site_id)
GO

ALTER TABLE assignment_set_user
    ADD CONSTRAINT fk_assignment_set_user_internal_contact_type_id
    FOREIGN KEY (internal_contact_type_did,site_id)
    REFERENCES contact_type(contact_type_did,site_id)
GO

ALTER TABLE appointment_association
    ADD CONSTRAINT fk_appointment_association
    FOREIGN KEY (appointment_id)
    REFERENCES appointment (appointment_id)
GO

ALTER TABLE appointment_attendee
    ADD CONSTRAINT fk_appointment_attendee
    FOREIGN KEY (owner_id)
    REFERENCES appointment (appointment_id)
GO

ALTER TABLE appointment_attendee_type_ml
    ADD CONSTRAINT fk_app_attendee_ml_app_attend
    FOREIGN KEY (attendee_type_code,site_id)
    REFERENCES appointment_attendee_type (attendee_type_code,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE appointment_attendee_type_ml
    ADD CONSTRAINT fk_app_attendee_ml_language
    FOREIGN KEY ( language_code, site_id)
    REFERENCES language ( language_code, site_id)
GO

-- Olympia profile objects

ALTER TABLE profile_role
    ADD CONSTRAINT fk_profile_role_profile
    FOREIGN KEY (profile_code,site_id)
    REFERENCES profile (profile_code,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE profile_user
    ADD CONSTRAINT fk_profile_user_profile
    FOREIGN KEY (profile_code,site_id)
    REFERENCES profile (profile_code,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE profile_role 
    ADD CONSTRAINT fk_profile_role_role
    FOREIGN KEY (role_name, site_id)
    REFERENCES role (role_name, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE profile_user  
    ADD CONSTRAINT fk_profile_user_user
    FOREIGN KEY (user_id, site_id)
    REFERENCES users (user_id, site_id)
    ON DELETE CASCADE
GO

ALTER TABLE profile  
    ADD CONSTRAINT fk_profile_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE profile  
    ADD CONSTRAINT fk_profile_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE profile_role  
    ADD CONSTRAINT fk_profile_role_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE profile_role  
    ADD CONSTRAINT fk_profile_role_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE profile_user  
    ADD CONSTRAINT fk_profile_user_insert_by
    FOREIGN KEY (insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE profile_user  
    ADD CONSTRAINT fk_profile_user_update_by
    FOREIGN KEY (update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE profile
    ADD CONSTRAINT fk_profile_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE profile_role
    ADD CONSTRAINT fk_profile_role_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE profile_user
    ADD CONSTRAINT fk_profile_user_site
    FOREIGN KEY (site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE profile_ml
    ADD CONSTRAINT fk_profile_ml
    FOREIGN KEY (profile_code,site_id)
    REFERENCES profile (profile_code,site_id)
    ON DELETE CASCADE
GO

ALTER TABLE profile_ml
    ADD CONSTRAINT fk_profile_ml_language
    FOREIGN KEY ( language_code, site_id)
    REFERENCES language ( language_code, site_id)
GO

ALTER TABLE external_user  
WITH CHECK ADD  CONSTRAINT FK_external_user_language FOREIGN KEY(language_code, site_id)
REFERENCES language (language_code, site_id)

Go

ALTER TABLE social_network  
    ADD  CONSTRAINT FK_social_network_insert_by 
    FOREIGN KEY(insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE social_network  
    ADD  CONSTRAINT FK_social_network_site 
    FOREIGN KEY(site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE social_network  
    ADD  CONSTRAINT FK_social_network_social_network_type 
    FOREIGN KEY(social_network_type, site_id)
    REFERENCES social_network_type (social_network_type_did, site_id)

GO

ALTER TABLE social_network  
    ADD  CONSTRAINT FK_social_network_update_by 
    FOREIGN KEY(update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE social_network_type  
    ADD  CONSTRAINT FK_social_network_type_insert_by 
    FOREIGN KEY(insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE social_network_type  
    ADD  CONSTRAINT FK_social_network_type_site 
    FOREIGN KEY(site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE social_network_type  
    ADD  CONSTRAINT FK_social_network_type_update_by 
    FOREIGN KEY(update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE social_network_type_ml  
    ADD  CONSTRAINT FK_social_network_type_ml_language 
    FOREIGN KEY(language_code, site_id)
    REFERENCES language (language_code, site_id)
GO

ALTER TABLE social_network_type_ml  
    ADD  CONSTRAINT FK_social_network_type_ml_social_network_type 
    FOREIGN KEY(social_network_type_did, site_id)
    REFERENCES social_network_type (social_network_type_did, site_id)
GO

ALTER TABLE email_address  
    ADD  CONSTRAINT fk_email_address_insert_by 
    FOREIGN KEY(insert_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE email_address  
    ADD  CONSTRAINT fk_email_address_site 
    FOREIGN KEY(site_id)
    REFERENCES site (site_id)
GO

ALTER TABLE email_address  
    ADD  CONSTRAINT fk_email_address_update_by 
    FOREIGN KEY(update_by, site_id)
    REFERENCES users (user_id, site_id)
GO

ALTER TABLE email_address  
    ADD  CONSTRAINT fk_email_address_type_ref 
    FOREIGN KEY(email_address_type_did, site_id)
    REFERENCES reference_parameter (reference_parameter_did, site_id)
GO