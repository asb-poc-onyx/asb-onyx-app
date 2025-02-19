/*
**
**  Name: persistenceDB_create_foreign_keys.sql
**
**  Purpose:  The purpose is to recreate foreign keys for persistence DB
**
**  @Rm++
**  Revision History
**  -------------------------------------------------------------------------
**  Date        Name     Description
**  -------------------------------------------------------------------------
**  04/07/2012	NFragar	Initial creation from persistence DB v7.1.1 MR using SQL Server Management Script DB Tool
**  09/03/2016	Paull	Upgrade for 77 - Onyx 7.7 GA (07.07.00.0013)\Customization Support\Database Server\Database Scripts\SchemaScripts\NavigatorInstall\navigator_foreign_keys.sql
**  
*/

-- 7.7

ALTER TABLE country_ml  WITH NOCHECK ADD  CONSTRAINT [fk_country_ml] FOREIGN KEY([country_code], [site_id])
REFERENCES country ([country_code], [site_id])
ON DELETE CASCADE
GO
ALTER TABLE country_ml CHECK CONSTRAINT [fk_country_ml]
GO
ALTER TABLE incident_product  WITH CHECK ADD  CONSTRAINT [fk_incident_product_status_ref] FOREIGN KEY([status_did], [site_id])
REFERENCES reference_parameter ([reference_parameter_did], [site_id])
GO
ALTER TABLE incident_product CHECK CONSTRAINT [fk_incident_product_status_ref]
GO
ALTER TABLE incident_product_ml  WITH CHECK ADD  CONSTRAINT [fk_incident_product_ml] FOREIGN KEY([incident_product_code], [incident_category_did], [site_id])
REFERENCES incident_product ([incident_product_code], [incident_category_did], [site_id])
ON DELETE CASCADE
GO
ALTER TABLE incident_product_ml CHECK CONSTRAINT [fk_incident_product_ml]
GO
ALTER TABLE navigator_operator_ml WITH CHECK ADD  CONSTRAINT [FK_navigator_operator_ml_navigator_operator] FOREIGN KEY([navigator_operator_did], [site_id])
REFERENCES navigator_operator ([navigator_operator_did], [site_id])
GO
ALTER TABLE navigator_operator_ml CHECK CONSTRAINT [FK_navigator_operator_ml_navigator_operator]
GO
ALTER TABLE reference_field  WITH NOCHECK ADD  CONSTRAINT [fk_reference_field_parent] FOREIGN KEY([parent_reference_field_did], [site_id])
REFERENCES reference_field ([reference_field_did], [site_id])
GO
ALTER TABLE reference_field CHECK CONSTRAINT [fk_reference_field_parent]
GO
ALTER TABLE reference_field_ml  WITH NOCHECK ADD  CONSTRAINT [fk_reference_field_ml] FOREIGN KEY([reference_field_did], [site_id])
REFERENCES reference_field ([reference_field_did], [site_id])
ON DELETE CASCADE
GO
ALTER TABLE reference_field_ml CHECK CONSTRAINT [fk_reference_field_ml]
GO
ALTER TABLE reference_lookup  WITH NOCHECK ADD  CONSTRAINT [FK_reference_lookup] FOREIGN KEY([reference_parameter_did], [site_id])
REFERENCES reference_parameter ([reference_parameter_did], [site_id])
GO
ALTER TABLE reference_lookup CHECK CONSTRAINT [FK_reference_lookup]
GO
ALTER TABLE reference_parameter  WITH NOCHECK ADD  CONSTRAINT [FK_reference_parameter_reference_parameter] FOREIGN KEY([reference_parameter_did], [site_id])
REFERENCES reference_parameter ([reference_parameter_did], [site_id])
GO
ALTER TABLE reference_parameter CHECK CONSTRAINT [FK_reference_parameter_reference_parameter]
GO
ALTER TABLE reference_parameter_ml WITH NOCHECK ADD  CONSTRAINT [FK_reference_parameter_ml] FOREIGN KEY([reference_parameter_did], [site_id])
REFERENCES reference_parameter ([reference_parameter_did], [site_id])
GO
ALTER TABLE reference_parameter_ml CHECK CONSTRAINT [FK_reference_parameter_ml]
GO
ALTER TABLE region  WITH NOCHECK ADD  CONSTRAINT [fk_region_country] FOREIGN KEY([country_code], [site_id])
REFERENCES country ([country_code], [site_id])
ON DELETE CASCADE
GO
ALTER TABLE region CHECK CONSTRAINT [fk_region_country]
GO
ALTER TABLE region_ml  WITH NOCHECK ADD  CONSTRAINT [fk_region_ml] FOREIGN KEY([region_code], [country_code], [site_id])
REFERENCES region ([region_code], [country_code], [site_id])
ON DELETE CASCADE
GO
ALTER TABLE region_ml CHECK CONSTRAINT [fk_region_ml]
GO
ALTER TABLE navigator_entity_field_master_ml  WITH CHECK ADD  CONSTRAINT [FK_navigator_entity_field_master_ml_language] FOREIGN KEY([language_code], [site_id])
REFERENCES language ([language_code], [site_id])
GO
ALTER TABLE navigator_entity_field_master_ml CHECK CONSTRAINT [FK_navigator_entity_field_master_ml_language]
GO
ALTER TABLE navigator_entity_field_master_ml  WITH CHECK ADD  CONSTRAINT [FK_navigator_entity_field_master_ml_navigator_entity_field_master] FOREIGN KEY([field_id], [site_id])
REFERENCES navigator_entity_field_master ([field_id], [site_id])
GO
ALTER TABLE navigator_entity_field_master_ml CHECK CONSTRAINT [FK_navigator_entity_field_master_ml_navigator_entity_field_master]
GO
ALTER TABLE navigator_entity_master_ml  WITH CHECK ADD  CONSTRAINT [FK_navigator_entity_master_ml_language] FOREIGN KEY([language_code], [site_id])
REFERENCES language ([language_code], [site_id])
GO
ALTER TABLE navigator_entity_master_ml CHECK CONSTRAINT [FK_navigator_entity_master_ml_language]
GO
ALTER TABLE navigator_entity_master_ml  WITH CHECK ADD  CONSTRAINT [FK_navigator_entity_master_ml_navigator_entity_master] FOREIGN KEY([entity_id], [site_id])
REFERENCES navigator_entity_master ([entity_id], [site_id])
GO
ALTER TABLE navigator_entity_master_ml CHECK CONSTRAINT [FK_navigator_entity_master_ml_navigator_entity_master]
GO
ALTER TABLE  [ActionButton]  
	WITH CHECK 
	ADD  CONSTRAINT [FK_ ActionButton_ActionGroup] 
		FOREIGN KEY([GroupId], [SiteId])
		REFERENCES  [ActionGroup] ([GroupId], [SiteId])
GO

ALTER TABLE  [ActionButton] 
	CHECK CONSTRAINT [FK_ ActionButton_ActionGroup]
GO

ALTER TABLE  [ActionButton]  
	WITH CHECK 
	ADD  CONSTRAINT [FK_ ActionButton_ActionListProfile] 
		FOREIGN KEY([ProfileId], [SiteId])
		REFERENCES  [ActionListProfile] ([ProfileId], [SiteId])
GO

ALTER TABLE  [ActionButton] 
	CHECK CONSTRAINT [FK_ ActionButton_ActionListProfile]
GO

ALTER TABLE  [ActionButton]  
	WITH CHECK 
	ADD  CONSTRAINT [FK_ ActionButton_navigator_entity_master] 
		FOREIGN KEY([EntityId], [SiteId])
		REFERENCES  [navigator_entity_master] ([entity_id], [site_id])
GO

ALTER TABLE  [ActionButton] 
	CHECK CONSTRAINT [FK_ ActionButton_navigator_entity_master]
GO

ALTER TABLE  [ActionButtonMl]  
	WITH CHECK 
	ADD  CONSTRAINT [FK_ ActionButtonMl_ ActionButton] 
		FOREIGN KEY([ActionButtonId], [SiteId])
		REFERENCES  [ActionButton] ([ActionButtonId], [SiteId])

GO
ALTER TABLE  [ActionButtonMl] 
	CHECK CONSTRAINT [FK_ ActionButtonMl_ ActionButton]

GO
ALTER TABLE  [ActionGroupMl]  
	WITH CHECK 
	ADD  CONSTRAINT [FK_ActionGroupMl_ActionGroup] 
		FOREIGN KEY([GroupId], [SiteId])
		REFERENCES  [ActionGroup] ([GroupId], [SiteId])
GO

ALTER TABLE  [ActionGroupMl] 
	CHECK CONSTRAINT [FK_ActionGroupMl_ActionGroup]
GO

ALTER TABLE  [ActionListProfileMl]  
	WITH CHECK 
	ADD  CONSTRAINT [FK_ActionListProfileMl_ActionListProfile] 
		FOREIGN KEY([ProfileId], [SiteId])
		REFERENCES  [ActionListProfile] ([ProfileId], [SiteId])
GO

ALTER TABLE  [ActionListProfileMl] 
	CHECK CONSTRAINT [FK_ActionListProfileMl_ActionListProfile]
GO

ALTER TABLE  [Broker]  
	WITH CHECK 
	ADD  CONSTRAINT [FK_Broker_ActionListProfile] 
		FOREIGN KEY([ProfileId], [SiteId])
		REFERENCES  [ActionListProfile] ([ProfileId], [SiteId])
GO

ALTER TABLE  [Broker] 
	CHECK CONSTRAINT [FK_Broker_ActionListProfile]
GO

ALTER TABLE  [EndPoint]  
	WITH CHECK 
	ADD  CONSTRAINT [FK_EndPoint_Broker] 
		FOREIGN KEY([BrokerId], [SiteId])
		REFERENCES  [Broker] ([BrokerId], [SiteId])
GO

ALTER TABLE  [EndPoint] 
	CHECK CONSTRAINT [FK_EndPoint_Broker]
GO

ALTER TABLE  [EndPoint]  
	WITH CHECK 
	ADD  CONSTRAINT [FK_EndPoint_EndPointType] 
		FOREIGN KEY([EndPointTypeId], [SiteId])
		REFERENCES  [EndPointType] ([EndPointTypeId], [siteId])
GO

ALTER TABLE  [EndPoint] 
	CHECK CONSTRAINT [FK_EndPoint_EndPointType]
GO

ALTER TABLE  [EndPointProperty]  
	WITH CHECK 
	ADD  CONSTRAINT [FK_EndPointProperty_EndPoint] 
		FOREIGN KEY([EndPointId], [SiteId])
		REFERENCES  [EndPoint] ([EndPointId], [SiteId])
GO

ALTER TABLE  [EndPointProperty] 
	CHECK CONSTRAINT [FK_EndPointProperty_EndPoint]
GO

ALTER TABLE  [EndPointProperty]  
	WITH CHECK ADD  
	CONSTRAINT [FK_EndPointProperty_EndPointPropertyName] 
		FOREIGN KEY([PropertyNameId], [SiteId])
		REFERENCES  [EndPointPropertyName] ([PropertyNameId], [SiteId])
GO
ALTER TABLE  [EndPointProperty] 
	CHECK CONSTRAINT [FK_EndPointProperty_EndPointPropertyName]

GO
ALTER TABLE  [EndPointTypeMl]  
	WITH CHECK 
	ADD  CONSTRAINT [FK_EndPointTypeMl_EndPointType] 
		FOREIGN KEY([EndPointTypeId], [SiteId])
		REFERENCES  [EndPointType] ([EndPointTypeId], [siteId])
GO
ALTER TABLE  [EndPointTypeMl] 
	CHECK CONSTRAINT [FK_EndPointTypeMl_EndPointType]
GO
ALTER TABLE  [EntityGroupMapper]  
	WITH CHECK 
	ADD  CONSTRAINT [FK_EntityGroupMapper_navigator_entity_master] 
		FOREIGN KEY([EntityId], [SiteId])
		REFERENCES  [navigator_entity_master] ([entity_id], [site_id])
GO
ALTER TABLE  [EntityGroupMapper] 
	CHECK CONSTRAINT [FK_EntityGroupMapper_navigator_entity_master]

GO
ALTER TABLE [QueryResult]  
	WITH CHECK 
	ADD  CONSTRAINT [FK_QueryResult_QueryProfile] 
		FOREIGN KEY([RequestSessionId])
		REFERENCES [dbo].[QueryProfile] ([RequestSessionId])
		
GO
ALTER TABLE [QueryResult] 
	CHECK CONSTRAINT [FK_QueryResult_QueryProfile]
GO
ALTER TABLE MobileBookmark  WITH 
	CHECK ADD  CONSTRAINT FK_MobileBookmark_query FOREIGN KEY(QueryId)
	REFERENCES query (query_id)
	ON DELETE CASCADE
GO

IF NOT  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'FK_NotificationType_NotificationDeliveryType') AND parent_object_id = OBJECT_ID(N'NotificationType'))
Begin
	ALTER TABLE NotificationType  WITH CHECK ADD  CONSTRAINT FK_NotificationType_NotificationDeliveryType FOREIGN KEY(NotificationDeliveryTypeId, SiteId)
	REFERENCES NotificationDeliveryType (NotificationDeliveryTypeId, SiteId)
	ALTER TABLE NotificationType CHECK CONSTRAINT FK_NotificationType_NotificationDeliveryType
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'FK_NotificationTypeMl_NotificationType') AND parent_object_id = OBJECT_ID(N'NotificationTypeMl'))
BEGIN
	ALTER TABLE NotificationTypeMl  WITH CHECK ADD  CONSTRAINT FK_NotificationTypeMl_NotificationType FOREIGN KEY(NotificationTypeId, SiteId)
	REFERENCES NotificationType (NotificationTypeId, SiteId)
	ON DELETE CASCADE
	ALTER TABLE NotificationTypeMl CHECK CONSTRAINT FK_NotificationTypeMl_NotificationType
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'FK_NotificationDeliveryTypeMl_NotificationDeliveryType') AND parent_object_id = OBJECT_ID(N'NotificationDeliveryTypeMl'))
BEGIN
	ALTER TABLE NotificationDeliveryTypeMl  WITH CHECK ADD  CONSTRAINT FK_NotificationDeliveryTypeMl_NotificationDeliveryType FOREIGN KEY(NotificationDeliveryTypeId, SiteId)
	REFERENCES NotificationDeliveryType (NotificationDeliveryTypeId, SiteId)
	ON DELETE CASCADE
ALTER TABLE NotificationDeliveryTypeMl CHECK CONSTRAINT FK_NotificationDeliveryTypeMl_NotificationDeliveryType
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'FK_NotificationSubscription_NotificationDeliveryType') AND parent_object_id = OBJECT_ID(N'NotificationSubscription'))
BEGIN
	ALTER TABLE NotificationSubscription  WITH CHECK ADD  CONSTRAINT FK_NotificationSubscription_NotificationDeliveryType FOREIGN KEY(NotificationDeliveryTypeId, SiteId)
	REFERENCES NotificationDeliveryType (NotificationDeliveryTypeId, SiteId)
	ALTER TABLE NotificationSubscription CHECK CONSTRAINT FK_NotificationSubscription_NotificationDeliveryType
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'FK_NotificationSubscription_NotificationType') AND parent_object_id = OBJECT_ID(N'NotificationSubscription'))
BEGIN
	ALTER TABLE NotificationSubscription  WITH CHECK ADD  CONSTRAINT FK_NotificationSubscription_NotificationType FOREIGN KEY(NotificationTypeId, SiteId)
	REFERENCES NotificationType (NotificationTypeId, SiteId)
	ALTER TABLE NotificationSubscription CHECK CONSTRAINT FK_NotificationSubscription_NotificationType
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'FK_NotificationSubscriptionForwarded_NotificationSubscription') AND parent_object_id = OBJECT_ID(N'NotificationSubscriptionForwarded'))
BEGIN
	ALTER TABLE NotificationSubscriptionForwarded  WITH CHECK ADD  CONSTRAINT FK_NotificationSubscriptionForwarded_NotificationSubscription FOREIGN KEY(NotificationSubscriptionId, SiteId)
	REFERENCES NotificationSubscription (NotificationSubscriptionId, SiteId)
	ON DELETE CASCADE
	ALTER TABLE NotificationSubscriptionForwarded CHECK CONSTRAINT FK_NotificationSubscriptionForwarded_NotificationSubscription
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'FK_NotificationPublishEvent_NotificationSubscription') AND parent_object_id = OBJECT_ID(N'[dbo].[NotificationPublishEvent]'))
BEGIN
	ALTER TABLE NotificationPublishEvent  WITH CHECK ADD  CONSTRAINT FK_NotificationPublishEvent_NotificationSubscription FOREIGN KEY([NotificationSubscriptionId], [SiteId])
	REFERENCES NotificationSubscription (NotificationSubscriptionId, SiteId)
	ALTER TABLE NotificationPublishEvent CHECK CONSTRAINT FK_NotificationPublishEvent_NotificationSubscription
END
GO

--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'FK_OutlookPublishEvent_NotificationType') AND parent_object_id = OBJECT_ID(N'OutlookPublishEvent'))
--BEGIN
--	ALTER TABLE OutlookPublishEvent  WITH CHECK ADD  CONSTRAINT FK_OutlookPublishEvent_NotificationType FOREIGN KEY(NotificationTypeId, SiteId)
--	REFERENCES NotificationType (NotificationTypeId, SiteId)
--	ALTER TABLE OutlookPublishEvent CHECK CONSTRAINT FK_OutlookPublishEvent_NotificationType
--END
--GO
--IF NOT  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'fk_Event_ChangeType') AND parent_object_id = OBJECT_ID(N'Event'))
--Begin
--	ALTER TABLE [Event]  WITH CHECK ADD  CONSTRAINT fk_Event_ChangeType FOREIGN KEY(ChangeTypeId, SiteId)
--	REFERENCES ChangeType (ChangeTypeId, SiteId)
--	ALTER TABLE [Event] CHECK CONSTRAINT fk_Event_ChangeType
--END
--GO

IF NOT  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'fk_Event_LboObject') AND parent_object_id = OBJECT_ID(N'Event'))
Begin
	ALTER TABLE [Event]  WITH CHECK ADD  CONSTRAINT fk_Event_LboObject FOREIGN KEY(LboObjectId, SiteId)
	REFERENCES LboObject (LboObjectId, SiteId)
	ALTER TABLE [Event] CHECK CONSTRAINT fk_Event_LboObject
END
GO
IF NOT  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'fk_EventFilter_Event') AND parent_object_id = OBJECT_ID(N'EventFilter'))
Begin
	ALTER TABLE EventFilter  WITH CHECK ADD  CONSTRAINT fk_EventFilter_Event FOREIGN KEY(EventId, SiteId)
	REFERENCES [Event] (EventId, SiteId)
	ALTER TABLE EventFilter CHECK CONSTRAINT fk_EventFilter_Event
END
GO
IF NOT  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'fk_EventMl_Event') AND parent_object_id = OBJECT_ID(N'EventMl'))
Begin
	ALTER TABLE EventMl  WITH CHECK ADD  CONSTRAINT fk_EventMl_Event FOREIGN KEY(EventId, SiteId)
	REFERENCES [Event] (EventId, SiteId)
	ALTER TABLE EventMl CHECK CONSTRAINT fk_EventMl_Event
END
GO
IF NOT  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'fk_NotificationEvent_NotificationType') AND parent_object_id = OBJECT_ID(N'NotificationEvent'))
Begin
	ALTER TABLE NotificationEvent  WITH CHECK ADD  CONSTRAINT fk_NotificationEvent_NotificationType FOREIGN KEY(NotificationTypeId, SiteId)
	REFERENCES NotificationType (NotificationTypeId, SiteId)
	ALTER TABLE NotificationEvent CHECK CONSTRAINT fk_NotificationEvent_NotificationType
END
GO
IF NOT  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'fk_NotificationEventChange_NotificationEvent') AND parent_object_id = OBJECT_ID(N'NotificationEventChange'))
Begin
	ALTER TABLE NotificationEventChange  WITH CHECK ADD  CONSTRAINT fk_NotificationEventChange_NotificationEvent FOREIGN KEY(NotificationEventId, SiteId)
	REFERENCES NotificationEvent (NotificationEventId, SiteId)
	ALTER TABLE NotificationEventChange CHECK CONSTRAINT fk_NotificationEventChange_NotificationEvent
END
GO
IF NOT  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'fk_EventChangeType_Event') AND parent_object_id = OBJECT_ID(N'EventChangeType'))
Begin
	ALTER TABLE EventChangeType  WITH CHECK ADD  CONSTRAINT fk_EventChangeType_Event FOREIGN KEY(EventId, SiteId)
	REFERENCES [Event] (EventId, SiteId)
	ALTER TABLE EventChangeType CHECK CONSTRAINT fk_EventChangeType_Event
END
GO
IF NOT  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'fk_EventChangeType_ChangeType') AND parent_object_id = OBJECT_ID(N'EventChangeType'))
Begin
	ALTER TABLE EventChangeType  WITH CHECK ADD  CONSTRAINT fk_EventChangeType_ChangeType FOREIGN KEY(ChangeTypeId, SiteId)
	REFERENCES ChangeType (ChangeTypeId, SiteId)
	ALTER TABLE EventChangeType CHECK CONSTRAINT fk_EventChangeType_ChangeType
END
GO

IF NOT  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'fk_OutLookPublishEvent_OutlookAppointment') AND parent_object_id = OBJECT_ID(N'OutLookPublishEvent'))
Begin
	ALTER TABLE OutLookPublishEvent  WITH CHECK ADD  CONSTRAINT fk_OutLookPublishEvent_OutlookAppointment FOREIGN KEY(OutlookAppointmentId, SiteId)
	REFERENCES OutlookAppointment (OutlookAppointmentId, SiteId)
	ALTER TABLE OutLookPublishEvent CHECK CONSTRAINT fk_OutLookPublishEvent_OutlookAppointment
END

-- 7.1
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ ActionButton_ActionGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[ActionButton]'))
--ALTER TABLE [dbo].[ActionButton]  WITH CHECK ADD  CONSTRAINT [FK_ ActionButton_ActionGroup] FOREIGN KEY([GroupId], [SiteId])
--REFERENCES [dbo].[ActionGroup] ([GroupId], [SiteId])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ ActionButton_ActionGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[ActionButton]'))
--ALTER TABLE [dbo].[ActionButton] CHECK CONSTRAINT [FK_ ActionButton_ActionGroup]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ ActionButton_ActionListProfile]') AND parent_object_id = OBJECT_ID(N'[dbo].[ActionButton]'))
--ALTER TABLE [dbo].[ActionButton]  WITH CHECK ADD  CONSTRAINT [FK_ ActionButton_ActionListProfile] FOREIGN KEY([ProfileId], [SiteId])
--REFERENCES [dbo].[ActionListProfile] ([ProfileId], [SiteId])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ ActionButton_ActionListProfile]') AND parent_object_id = OBJECT_ID(N'[dbo].[ActionButton]'))
--ALTER TABLE [dbo].[ActionButton] CHECK CONSTRAINT [FK_ ActionButton_ActionListProfile]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ ActionButton_navigator_entity_master]') AND parent_object_id = OBJECT_ID(N'[dbo].[ActionButton]'))
--ALTER TABLE [dbo].[ActionButton]  WITH CHECK ADD  CONSTRAINT [FK_ ActionButton_navigator_entity_master] FOREIGN KEY([EntityId], [SiteId])
--REFERENCES [dbo].[navigator_entity_master] ([entity_id], [site_id])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ ActionButton_navigator_entity_master]') AND parent_object_id = OBJECT_ID(N'[dbo].[ActionButton]'))
--ALTER TABLE [dbo].[ActionButton] CHECK CONSTRAINT [FK_ ActionButton_navigator_entity_master]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ ActionButtonMl_ ActionButton]') AND parent_object_id = OBJECT_ID(N'[dbo].[ActionButtonMl]'))
--ALTER TABLE [dbo].[ActionButtonMl]  WITH CHECK ADD  CONSTRAINT [FK_ ActionButtonMl_ ActionButton] FOREIGN KEY([ActionButtonId], [SiteId])
--REFERENCES [dbo].[ActionButton] ([ActionButtonId], [SiteId])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ ActionButtonMl_ ActionButton]') AND parent_object_id = OBJECT_ID(N'[dbo].[ActionButtonMl]'))
--ALTER TABLE [dbo].[ActionButtonMl] CHECK CONSTRAINT [FK_ ActionButtonMl_ ActionButton]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActionGroupMl_ActionGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[ActionGroupMl]'))
--ALTER TABLE [dbo].[ActionGroupMl]  WITH CHECK ADD  CONSTRAINT [FK_ActionGroupMl_ActionGroup] FOREIGN KEY([GroupId], [SiteId])
--REFERENCES [dbo].[ActionGroup] ([GroupId], [SiteId])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActionGroupMl_ActionGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[ActionGroupMl]'))
--ALTER TABLE [dbo].[ActionGroupMl] CHECK CONSTRAINT [FK_ActionGroupMl_ActionGroup]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActionListProfileMl_ActionListProfile]') AND parent_object_id = OBJECT_ID(N'[dbo].[ActionListProfileMl]'))
--ALTER TABLE [dbo].[ActionListProfileMl]  WITH CHECK ADD  CONSTRAINT [FK_ActionListProfileMl_ActionListProfile] FOREIGN KEY([ProfileId], [SiteId])
--REFERENCES [dbo].[ActionListProfile] ([ProfileId], [SiteId])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActionListProfileMl_ActionListProfile]') AND parent_object_id = OBJECT_ID(N'[dbo].[ActionListProfileMl]'))
--ALTER TABLE [dbo].[ActionListProfileMl] CHECK CONSTRAINT [FK_ActionListProfileMl_ActionListProfile]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Broker_ActionListProfile]') AND parent_object_id = OBJECT_ID(N'[dbo].[Broker]'))
--ALTER TABLE [dbo].[Broker]  WITH CHECK ADD  CONSTRAINT [FK_Broker_ActionListProfile] FOREIGN KEY([ProfileId], [SiteId])
--REFERENCES [dbo].[ActionListProfile] ([ProfileId], [SiteId])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Broker_ActionListProfile]') AND parent_object_id = OBJECT_ID(N'[dbo].[Broker]'))
--ALTER TABLE [dbo].[Broker] CHECK CONSTRAINT [FK_Broker_ActionListProfile]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_country_ml]') AND parent_object_id = OBJECT_ID(N'[dbo].[country_ml]'))
--ALTER TABLE [dbo].[country_ml]  WITH NOCHECK ADD  CONSTRAINT [fk_country_ml] FOREIGN KEY([country_code], [site_id])
--REFERENCES [dbo].[country] ([country_code], [site_id])
--ON DELETE CASCADE
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_country_ml]') AND parent_object_id = OBJECT_ID(N'[dbo].[country_ml]'))
--ALTER TABLE [dbo].[country_ml] CHECK CONSTRAINT [fk_country_ml]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EndPoint_Broker]') AND parent_object_id = OBJECT_ID(N'[dbo].[EndPoint]'))
--ALTER TABLE [dbo].[EndPoint]  WITH CHECK ADD  CONSTRAINT [FK_EndPoint_Broker] FOREIGN KEY([BrokerId], [SiteId])
--REFERENCES [dbo].[Broker] ([BrokerId], [SiteId])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EndPoint_Broker]') AND parent_object_id = OBJECT_ID(N'[dbo].[EndPoint]'))
--ALTER TABLE [dbo].[EndPoint] CHECK CONSTRAINT [FK_EndPoint_Broker]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EndPoint_EndPointType]') AND parent_object_id = OBJECT_ID(N'[dbo].[EndPoint]'))
--ALTER TABLE [dbo].[EndPoint]  WITH CHECK ADD  CONSTRAINT [FK_EndPoint_EndPointType] FOREIGN KEY([EndPointTypeId], [SiteId])
--REFERENCES [dbo].[EndPointType] ([EndPointTypeId], [siteId])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EndPoint_EndPointType]') AND parent_object_id = OBJECT_ID(N'[dbo].[EndPoint]'))
--ALTER TABLE [dbo].[EndPoint] CHECK CONSTRAINT [FK_EndPoint_EndPointType]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EndPointProperty_EndPoint]') AND parent_object_id = OBJECT_ID(N'[dbo].[EndPointProperty]'))
--ALTER TABLE [dbo].[EndPointProperty]  WITH CHECK ADD  CONSTRAINT [FK_EndPointProperty_EndPoint] FOREIGN KEY([EndPointId], [SiteId])
--REFERENCES [dbo].[EndPoint] ([EndPointId], [SiteId])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EndPointProperty_EndPoint]') AND parent_object_id = OBJECT_ID(N'[dbo].[EndPointProperty]'))
--ALTER TABLE [dbo].[EndPointProperty] CHECK CONSTRAINT [FK_EndPointProperty_EndPoint]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EndPointProperty_EndPointPropertyName]') AND parent_object_id = OBJECT_ID(N'[dbo].[EndPointProperty]'))
--ALTER TABLE [dbo].[EndPointProperty]  WITH CHECK ADD  CONSTRAINT [FK_EndPointProperty_EndPointPropertyName] FOREIGN KEY([PropertyNameId], [SiteId])
--REFERENCES [dbo].[EndPointPropertyName] ([PropertyNameId], [SiteId])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EndPointProperty_EndPointPropertyName]') AND parent_object_id = OBJECT_ID(N'[dbo].[EndPointProperty]'))
--ALTER TABLE [dbo].[EndPointProperty] CHECK CONSTRAINT [FK_EndPointProperty_EndPointPropertyName]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EndPointTypeMl_EndPointType]') AND parent_object_id = OBJECT_ID(N'[dbo].[EndPointTypeMl]'))
--ALTER TABLE [dbo].[EndPointTypeMl]  WITH CHECK ADD  CONSTRAINT [FK_EndPointTypeMl_EndPointType] FOREIGN KEY([EndPointTypeId], [SiteId])
--REFERENCES [dbo].[EndPointType] ([EndPointTypeId], [siteId])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EndPointTypeMl_EndPointType]') AND parent_object_id = OBJECT_ID(N'[dbo].[EndPointTypeMl]'))
--ALTER TABLE [dbo].[EndPointTypeMl] CHECK CONSTRAINT [FK_EndPointTypeMl_EndPointType]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EntityGroupMapper_navigator_entity_master]') AND parent_object_id = OBJECT_ID(N'[dbo].[EntityGroupMapper]'))
--ALTER TABLE [dbo].[EntityGroupMapper]  WITH CHECK ADD  CONSTRAINT [FK_EntityGroupMapper_navigator_entity_master] FOREIGN KEY([EntityId], [SiteId])
--REFERENCES [dbo].[navigator_entity_master] ([entity_id], [site_id])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EntityGroupMapper_navigator_entity_master]') AND parent_object_id = OBJECT_ID(N'[dbo].[EntityGroupMapper]'))
--ALTER TABLE [dbo].[EntityGroupMapper] CHECK CONSTRAINT [FK_EntityGroupMapper_navigator_entity_master]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_folder_ml_folder]') AND parent_object_id = OBJECT_ID(N'[dbo].[folder_ml]'))
--ALTER TABLE [dbo].[folder_ml]  WITH CHECK ADD  CONSTRAINT [FK_folder_ml_folder] FOREIGN KEY([folder_id], [site_id])
--REFERENCES [dbo].[folder] ([folder_id], [site_id])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_folder_ml_folder]') AND parent_object_id = OBJECT_ID(N'[dbo].[folder_ml]'))
--ALTER TABLE [dbo].[folder_ml] CHECK CONSTRAINT [FK_folder_ml_folder]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_folder_ml_language]') AND parent_object_id = OBJECT_ID(N'[dbo].[folder_ml]'))
--ALTER TABLE [dbo].[folder_ml]  WITH CHECK ADD  CONSTRAINT [FK_folder_ml_language] FOREIGN KEY([language_code], [site_id])
--REFERENCES [dbo].[language] ([language_code], [site_id])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_folder_ml_language]') AND parent_object_id = OBJECT_ID(N'[dbo].[folder_ml]'))
--ALTER TABLE [dbo].[folder_ml] CHECK CONSTRAINT [FK_folder_ml_language]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_incident_product_status_ref]') AND parent_object_id = OBJECT_ID(N'[dbo].[incident_product]'))
--ALTER TABLE [dbo].[incident_product]  WITH CHECK ADD  CONSTRAINT [fk_incident_product_status_ref] FOREIGN KEY([status_did], [site_id])
--REFERENCES [dbo].[reference_parameter] ([reference_parameter_did], [site_id])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_incident_product_status_ref]') AND parent_object_id = OBJECT_ID(N'[dbo].[incident_product]'))
--ALTER TABLE [dbo].[incident_product] CHECK CONSTRAINT [fk_incident_product_status_ref]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_incident_product_ml]') AND parent_object_id = OBJECT_ID(N'[dbo].[incident_product_ml]'))
--ALTER TABLE [dbo].[incident_product_ml]  WITH CHECK ADD  CONSTRAINT [fk_incident_product_ml] FOREIGN KEY([incident_product_code], [incident_category_did], [site_id])
--REFERENCES [dbo].[incident_product] ([incident_product_code], [incident_category_did], [site_id])
--ON DELETE CASCADE
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_incident_product_ml]') AND parent_object_id = OBJECT_ID(N'[dbo].[incident_product_ml]'))
--ALTER TABLE [dbo].[incident_product_ml] CHECK CONSTRAINT [fk_incident_product_ml]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_navigator_entity_field_master_ml_language]') AND parent_object_id = OBJECT_ID(N'[dbo].[navigator_entity_field_master_ml]'))
--ALTER TABLE [dbo].[navigator_entity_field_master_ml]  WITH CHECK ADD  CONSTRAINT [FK_navigator_entity_field_master_ml_language] FOREIGN KEY([language_code], [site_id])
--REFERENCES [dbo].[language] ([language_code], [site_id])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_navigator_entity_field_master_ml_language]') AND parent_object_id = OBJECT_ID(N'[dbo].[navigator_entity_field_master_ml]'))
--ALTER TABLE [dbo].[navigator_entity_field_master_ml] CHECK CONSTRAINT [FK_navigator_entity_field_master_ml_language]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_navigator_entity_field_master_ml_navigator_entity_field_master]') AND parent_object_id = OBJECT_ID(N'[dbo].[navigator_entity_field_master_ml]'))
--ALTER TABLE [dbo].[navigator_entity_field_master_ml]  WITH CHECK ADD  CONSTRAINT [FK_navigator_entity_field_master_ml_navigator_entity_field_master] FOREIGN KEY([field_id], [site_id])
--REFERENCES [dbo].[navigator_entity_field_master] ([field_id], [site_id])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_navigator_entity_field_master_ml_navigator_entity_field_master]') AND parent_object_id = OBJECT_ID(N'[dbo].[navigator_entity_field_master_ml]'))
--ALTER TABLE [dbo].[navigator_entity_field_master_ml] CHECK CONSTRAINT [FK_navigator_entity_field_master_ml_navigator_entity_field_master]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_navigator_entity_master_ml_language]') AND parent_object_id = OBJECT_ID(N'[dbo].[navigator_entity_master_ml]'))
--ALTER TABLE [dbo].[navigator_entity_master_ml]  WITH CHECK ADD  CONSTRAINT [FK_navigator_entity_master_ml_language] FOREIGN KEY([language_code], [site_id])
--REFERENCES [dbo].[language] ([language_code], [site_id])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_navigator_entity_master_ml_language]') AND parent_object_id = OBJECT_ID(N'[dbo].[navigator_entity_master_ml]'))
--ALTER TABLE [dbo].[navigator_entity_master_ml] CHECK CONSTRAINT [FK_navigator_entity_master_ml_language]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_navigator_entity_master_ml_navigator_entity_master]') AND parent_object_id = OBJECT_ID(N'[dbo].[navigator_entity_master_ml]'))
--ALTER TABLE [dbo].[navigator_entity_master_ml]  WITH CHECK ADD  CONSTRAINT [FK_navigator_entity_master_ml_navigator_entity_master] FOREIGN KEY([entity_id], [site_id])
--REFERENCES [dbo].[navigator_entity_master] ([entity_id], [site_id])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_navigator_entity_master_ml_navigator_entity_master]') AND parent_object_id = OBJECT_ID(N'[dbo].[navigator_entity_master_ml]'))
--ALTER TABLE [dbo].[navigator_entity_master_ml] CHECK CONSTRAINT [FK_navigator_entity_master_ml_navigator_entity_master]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_navigator_operator_ml_navigator_operator]') AND parent_object_id = OBJECT_ID(N'[dbo].[navigator_operator_ml]'))
--ALTER TABLE [dbo].[navigator_operator_ml]  WITH CHECK ADD  CONSTRAINT [FK_navigator_operator_ml_navigator_operator] FOREIGN KEY([navigator_operator_did], [site_id])
--REFERENCES [dbo].[navigator_operator] ([navigator_operator_did], [site_id])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_navigator_operator_ml_navigator_operator]') AND parent_object_id = OBJECT_ID(N'[dbo].[navigator_operator_ml]'))
--ALTER TABLE [dbo].[navigator_operator_ml] CHECK CONSTRAINT [FK_navigator_operator_ml_navigator_operator]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_reference_field_parent]') AND parent_object_id = OBJECT_ID(N'[dbo].[reference_field]'))
--ALTER TABLE [dbo].[reference_field]  WITH NOCHECK ADD  CONSTRAINT [fk_reference_field_parent] FOREIGN KEY([parent_reference_field_did], [site_id])
--REFERENCES [dbo].[reference_field] ([reference_field_did], [site_id])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_reference_field_parent]') AND parent_object_id = OBJECT_ID(N'[dbo].[reference_field]'))
--ALTER TABLE [dbo].[reference_field] CHECK CONSTRAINT [fk_reference_field_parent]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_reference_field_ml]') AND parent_object_id = OBJECT_ID(N'[dbo].[reference_field_ml]'))
--ALTER TABLE [dbo].[reference_field_ml]  WITH NOCHECK ADD  CONSTRAINT [fk_reference_field_ml] FOREIGN KEY([reference_field_did], [site_id])
--REFERENCES [dbo].[reference_field] ([reference_field_did], [site_id])
--ON DELETE CASCADE
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_reference_field_ml]') AND parent_object_id = OBJECT_ID(N'[dbo].[reference_field_ml]'))
--ALTER TABLE [dbo].[reference_field_ml] CHECK CONSTRAINT [fk_reference_field_ml]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_reference_lookup]') AND parent_object_id = OBJECT_ID(N'[dbo].[reference_lookup]'))
--ALTER TABLE [dbo].[reference_lookup]  WITH NOCHECK ADD  CONSTRAINT [FK_reference_lookup] FOREIGN KEY([reference_parameter_did], [site_id])
--REFERENCES [dbo].[reference_parameter] ([reference_parameter_did], [site_id])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_reference_lookup]') AND parent_object_id = OBJECT_ID(N'[dbo].[reference_lookup]'))
--ALTER TABLE [dbo].[reference_lookup] CHECK CONSTRAINT [FK_reference_lookup]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_reference_parameter_reference_parameter]') AND parent_object_id = OBJECT_ID(N'[dbo].[reference_parameter]'))
--ALTER TABLE [dbo].[reference_parameter]  WITH NOCHECK ADD  CONSTRAINT [FK_reference_parameter_reference_parameter] FOREIGN KEY([reference_parameter_did], [site_id])
--REFERENCES [dbo].[reference_parameter] ([reference_parameter_did], [site_id])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_reference_parameter_reference_parameter]') AND parent_object_id = OBJECT_ID(N'[dbo].[reference_parameter]'))
--ALTER TABLE [dbo].[reference_parameter] CHECK CONSTRAINT [FK_reference_parameter_reference_parameter]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_reference_parameter_ml]') AND parent_object_id = OBJECT_ID(N'[dbo].[reference_parameter_ml]'))
--ALTER TABLE [dbo].[reference_parameter_ml]  WITH NOCHECK ADD  CONSTRAINT [FK_reference_parameter_ml] FOREIGN KEY([reference_parameter_did], [site_id])
--REFERENCES [dbo].[reference_parameter] ([reference_parameter_did], [site_id])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_reference_parameter_ml]') AND parent_object_id = OBJECT_ID(N'[dbo].[reference_parameter_ml]'))
--ALTER TABLE [dbo].[reference_parameter_ml] CHECK CONSTRAINT [FK_reference_parameter_ml]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_region_country]') AND parent_object_id = OBJECT_ID(N'[dbo].[region]'))
--ALTER TABLE [dbo].[region]  WITH NOCHECK ADD  CONSTRAINT [fk_region_country] FOREIGN KEY([country_code], [site_id])
--REFERENCES [dbo].[country] ([country_code], [site_id])
--ON DELETE CASCADE
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_region_country]') AND parent_object_id = OBJECT_ID(N'[dbo].[region]'))
--ALTER TABLE [dbo].[region] CHECK CONSTRAINT [fk_region_country]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_region_ml]') AND parent_object_id = OBJECT_ID(N'[dbo].[region_ml]'))
--ALTER TABLE [dbo].[region_ml]  WITH NOCHECK ADD  CONSTRAINT [fk_region_ml] FOREIGN KEY([region_code], [country_code], [site_id])
--REFERENCES [dbo].[region] ([region_code], [country_code], [site_id])
--ON DELETE CASCADE
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_region_ml]') AND parent_object_id = OBJECT_ID(N'[dbo].[region_ml]'))
--ALTER TABLE [dbo].[region_ml] CHECK CONSTRAINT [fk_region_ml]
--GO

