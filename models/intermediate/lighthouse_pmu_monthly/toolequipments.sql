-- DBT AUTOMATION has generated this model, please DO NOT EDIT 
-- Please make sure you don't change the model name 

{{ 
  config(
    materialized='table',
    indexes=[
      {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
    ]
  ) 
}}

SELECT
  vcid as "vcid",
  academicyearid as "academicyearid",
  rmlastreceiveddate as "rmlastreceiveddate",
  rawmaterialrequired as "rawmaterialrequired",
  toollistid as "toollistid",
  isselected as "isselected",
  refinstalled as "refinstalled",
  rawmaterialstatus as "rawmaterialstatus",
  updatedby as "updatedby",
  rawmaterialname as "rawmaterialname",
  rfnreceivestatus as "rfnreceivestatus",
  remarks as "remarks",
  wfcount as "wfcount",
  iswindowgrills as "iswindowgrills",
  flooring as "flooring",
  roomsize as "roomsize",
  updatedon as "updatedon",
  oftestatus as "oftestatus",
  isspecify as "isspecify",
  sectorid as "sectorid",
  workingswitchboard as "workingswitchboard",
  schoolid as "schoolid",
  rmstatus as "rmstatus",
  districtcode as "districtcode",
  issetupworkshop as "issetupworkshop",
  labfilepath as "labfilepath",
  createdby as "createdby",
  toolliststatus as "toolliststatus",
  totalwindowcount as "totalwindowcount",
  iswindowlocked as "iswindowlocked",
  tlfilepath as "tlfilepath",
  details as "details",
  iscommunicated as "iscommunicated",
  psscount as "psscount",
  oatestatus as "oatestatus",
  rawmaterialid as "rawmaterialid",
  isdoorlock as "isdoorlock",
  roomwindows as "roomwindows",
  isactive as "isactive",
  divisionid as "divisionid",
  reason as "reason",
  quantitycount as "quantitycount",
  vtid as "vtid",
  roomtype as "roomtype",
  tlactionneeded2 as "tlactionneeded2",
  tlactionneeded1 as "tlactionneeded1",
  toolequipmentrdid as "toolequipmentrdid",
  createdon as "createdon",
  rmfundstatus as "rmfundstatus",
  testatus as "testatus",
  jobroleid as "jobroleid",
  tereceivestatus as "tereceivestatus",
  wlcount as "wlcount",
  toolequipmentid as "toolequipmentid",
  rawmaterialaction as "rawmaterialaction",
  accommodatetools as "accommodatetools",
  vtpid as "vtpid",
  receiptdate as "receiptdate",
  isroomactive as "isroomactive",
  _airbyte_ab_id as "_airbyte_ab_id",
  _airbyte_emitted_at as "_airbyte_emitted_at",
  _airbyte_normalized_at as "_airbyte_normalized_at",
  _airbyte_toolequipments_hashid as "_airbyte_toolequipments_hashid"
FROM {{source('source_lahi', 'toolequipments')}}
