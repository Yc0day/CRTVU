USE [teamsmsdb]
GO
/****** Object:  Table [dbo].[sym_outgoing_batch]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_outgoing_batch](
	[batch_id] [bigint] NOT NULL,
	[node_id] [varchar](50) NOT NULL,
	[channel_id] [varchar](128) NULL,
	[status] [char](2) NULL,
	[error_flag] [smallint] NULL,
	[sql_state] [varchar](10) NULL,
	[sql_code] [int] NOT NULL,
	[sql_message] [text] NULL,
	[last_update_hostname] [varchar](255) NULL,
	[last_update_time] [datetime2](7) NULL,
	[create_time] [datetime2](7) NULL,
	[summary] [varchar](255) NULL,
	[ignore_count] [int] NOT NULL,
	[byte_count] [bigint] NOT NULL,
	[load_flag] [smallint] NULL,
	[extract_count] [int] NOT NULL,
	[sent_count] [int] NOT NULL,
	[load_count] [int] NOT NULL,
	[reload_row_count] [int] NOT NULL,
	[other_row_count] [int] NOT NULL,
	[data_row_count] [int] NOT NULL,
	[extract_row_count] [int] NOT NULL,
	[load_row_count] [int] NOT NULL,
	[data_insert_row_count] [int] NOT NULL,
	[data_update_row_count] [int] NOT NULL,
	[data_delete_row_count] [int] NOT NULL,
	[extract_insert_row_count] [int] NOT NULL,
	[extract_update_row_count] [int] NOT NULL,
	[extract_delete_row_count] [int] NOT NULL,
	[load_insert_row_count] [int] NOT NULL,
	[load_update_row_count] [int] NOT NULL,
	[load_delete_row_count] [int] NOT NULL,
	[network_millis] [int] NOT NULL,
	[filter_millis] [int] NOT NULL,
	[load_millis] [int] NOT NULL,
	[router_millis] [int] NOT NULL,
	[extract_millis] [int] NOT NULL,
	[transform_extract_millis] [int] NOT NULL,
	[transform_load_millis] [int] NOT NULL,
	[load_id] [bigint] NULL,
	[common_flag] [smallint] NULL,
	[fallback_insert_count] [int] NOT NULL,
	[fallback_update_count] [int] NOT NULL,
	[ignore_row_count] [int] NOT NULL,
	[missing_delete_count] [int] NOT NULL,
	[skip_count] [int] NOT NULL,
	[total_extract_millis] [int] NOT NULL,
	[total_load_millis] [int] NOT NULL,
	[extract_job_flag] [smallint] NULL,
	[extract_start_time] [datetime2](7) NULL,
	[transfer_start_time] [datetime2](7) NULL,
	[load_start_time] [datetime2](7) NULL,
	[failed_data_id] [bigint] NOT NULL,
	[failed_line_number] [bigint] NOT NULL,
	[create_by] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[batch_id] ASC,
	[node_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[sym_outgoing_batch] SET (LOCK_ESCALATION = DISABLE)
GO
/****** Object:  Table [dbo].[sym_monitor_event]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_monitor_event](
	[monitor_id] [varchar](128) NOT NULL,
	[node_id] [varchar](50) NOT NULL,
	[event_time] [datetime2](7) NOT NULL,
	[host_name] [varchar](60) NULL,
	[type] [varchar](50) NOT NULL,
	[threshold] [bigint] NOT NULL,
	[event_value] [bigint] NOT NULL,
	[event_count] [int] NOT NULL,
	[severity_level] [int] NOT NULL,
	[is_resolved] [smallint] NOT NULL,
	[is_notified] [smallint] NOT NULL,
	[details] [text] NULL,
	[last_update_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[monitor_id] ASC,
	[node_id] ASC,
	[event_time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[sym_monitor_event] SET (LOCK_ESCALATION = DISABLE)
GO
/****** Object:  Table [dbo].[sym_node_host_stats]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_node_host_stats](
	[node_id] [varchar](50) NOT NULL,
	[host_name] [varchar](60) NOT NULL,
	[start_time] [datetime2](7) NOT NULL,
	[end_time] [datetime2](7) NOT NULL,
	[restarted] [bigint] NOT NULL,
	[nodes_pulled] [bigint] NULL,
	[total_nodes_pull_time] [bigint] NULL,
	[nodes_pushed] [bigint] NULL,
	[total_nodes_push_time] [bigint] NULL,
	[nodes_rejected] [bigint] NULL,
	[nodes_registered] [bigint] NULL,
	[nodes_loaded] [bigint] NULL,
	[nodes_disabled] [bigint] NULL,
	[purged_data_rows] [bigint] NULL,
	[purged_data_event_rows] [bigint] NULL,
	[purged_batch_outgoing_rows] [bigint] NULL,
	[purged_batch_incoming_rows] [bigint] NULL,
	[triggers_created_count] [bigint] NULL,
	[triggers_rebuilt_count] [bigint] NULL,
	[triggers_removed_count] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[node_id] ASC,
	[host_name] ASC,
	[start_time] ASC,
	[end_time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_node_host_job_stats]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_node_host_job_stats](
	[node_id] [varchar](50) NOT NULL,
	[host_name] [varchar](60) NOT NULL,
	[job_name] [varchar](50) NOT NULL,
	[start_time] [datetime2](7) NOT NULL,
	[end_time] [datetime2](7) NOT NULL,
	[processed_count] [bigint] NULL,
	[target_node_id] [varchar](50) NULL,
	[target_node_count] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[node_id] ASC,
	[host_name] ASC,
	[job_name] ASC,
	[start_time] ASC,
	[end_time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_node_host_channel_stats]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_node_host_channel_stats](
	[node_id] [varchar](50) NOT NULL,
	[host_name] [varchar](60) NOT NULL,
	[channel_id] [varchar](128) NOT NULL,
	[start_time] [datetime2](7) NOT NULL,
	[end_time] [datetime2](7) NOT NULL,
	[data_routed] [bigint] NULL,
	[data_unrouted] [bigint] NULL,
	[data_event_inserted] [bigint] NULL,
	[data_extracted] [bigint] NULL,
	[data_bytes_extracted] [bigint] NULL,
	[data_extracted_errors] [bigint] NULL,
	[data_bytes_sent] [bigint] NULL,
	[data_sent] [bigint] NULL,
	[data_sent_errors] [bigint] NULL,
	[data_loaded] [bigint] NULL,
	[data_bytes_loaded] [bigint] NULL,
	[data_loaded_errors] [bigint] NULL,
	[data_loaded_outgoing] [bigint] NULL,
	[data_bytes_loaded_outgoing] [bigint] NULL,
	[data_loaded_outgoing_errors] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[node_id] ASC,
	[host_name] ASC,
	[channel_id] ASC,
	[start_time] ASC,
	[end_time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_incoming_error]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_incoming_error](
	[batch_id] [bigint] NOT NULL,
	[node_id] [varchar](50) NOT NULL,
	[failed_row_number] [bigint] NOT NULL,
	[failed_line_number] [bigint] NOT NULL,
	[target_catalog_name] [varchar](255) NULL,
	[target_schema_name] [varchar](255) NULL,
	[target_table_name] [varchar](255) NOT NULL,
	[event_type] [char](1) NOT NULL,
	[binary_encoding] [varchar](10) NOT NULL,
	[column_names] [text] NOT NULL,
	[pk_column_names] [text] NOT NULL,
	[row_data] [text] NULL,
	[old_data] [text] NULL,
	[cur_data] [text] NULL,
	[resolve_data] [text] NULL,
	[resolve_ignore] [smallint] NULL,
	[conflict_id] [varchar](50) NULL,
	[create_time] [datetime2](7) NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[batch_id] ASC,
	[node_id] ASC,
	[failed_row_number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_incoming_batch]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_incoming_batch](
	[batch_id] [bigint] NOT NULL,
	[node_id] [varchar](50) NOT NULL,
	[channel_id] [varchar](128) NULL,
	[status] [char](2) NULL,
	[error_flag] [smallint] NULL,
	[sql_state] [varchar](10) NULL,
	[sql_code] [int] NOT NULL,
	[sql_message] [text] NULL,
	[last_update_hostname] [varchar](255) NULL,
	[last_update_time] [datetime2](7) NULL,
	[create_time] [datetime2](7) NULL,
	[summary] [varchar](255) NULL,
	[ignore_count] [int] NOT NULL,
	[byte_count] [bigint] NOT NULL,
	[load_flag] [smallint] NULL,
	[extract_count] [int] NOT NULL,
	[sent_count] [int] NOT NULL,
	[load_count] [int] NOT NULL,
	[reload_row_count] [int] NOT NULL,
	[other_row_count] [int] NOT NULL,
	[data_row_count] [int] NOT NULL,
	[extract_row_count] [int] NOT NULL,
	[load_row_count] [int] NOT NULL,
	[data_insert_row_count] [int] NOT NULL,
	[data_update_row_count] [int] NOT NULL,
	[data_delete_row_count] [int] NOT NULL,
	[extract_insert_row_count] [int] NOT NULL,
	[extract_update_row_count] [int] NOT NULL,
	[extract_delete_row_count] [int] NOT NULL,
	[load_insert_row_count] [int] NOT NULL,
	[load_update_row_count] [int] NOT NULL,
	[load_delete_row_count] [int] NOT NULL,
	[network_millis] [int] NOT NULL,
	[filter_millis] [int] NOT NULL,
	[load_millis] [int] NOT NULL,
	[router_millis] [int] NOT NULL,
	[extract_millis] [int] NOT NULL,
	[transform_extract_millis] [int] NOT NULL,
	[transform_load_millis] [int] NOT NULL,
	[load_id] [bigint] NULL,
	[common_flag] [smallint] NULL,
	[fallback_insert_count] [int] NOT NULL,
	[fallback_update_count] [int] NOT NULL,
	[ignore_row_count] [int] NOT NULL,
	[missing_delete_count] [int] NOT NULL,
	[skip_count] [int] NOT NULL,
	[failed_row_number] [int] NOT NULL,
	[failed_line_number] [int] NOT NULL,
	[failed_data_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[batch_id] ASC,
	[node_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_lock]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_lock](
	[lock_action] [varchar](50) NOT NULL,
	[lock_type] [varchar](50) NOT NULL,
	[locking_server_id] [varchar](255) NULL,
	[lock_time] [datetime2](7) NULL,
	[shared_count] [int] NOT NULL,
	[shared_enable] [int] NOT NULL,
	[last_lock_time] [datetime2](7) NULL,
	[last_locking_server_id] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[lock_action] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_file_snapshot]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_file_snapshot](
	[trigger_id] [varchar](128) NOT NULL,
	[router_id] [varchar](50) NOT NULL,
	[relative_dir] [varchar](255) NOT NULL,
	[file_name] [varchar](128) NOT NULL,
	[channel_id] [varchar](128) NOT NULL,
	[reload_channel_id] [varchar](128) NOT NULL,
	[last_event_type] [char](1) NOT NULL,
	[crc32_checksum] [bigint] NULL,
	[file_size] [bigint] NULL,
	[file_modified_time] [bigint] NULL,
	[last_update_time] [datetime2](7) NOT NULL,
	[last_update_by] [varchar](50) NULL,
	[create_time] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[trigger_id] ASC,
	[router_id] ASC,
	[relative_dir] ASC,
	[file_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_file_incoming]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_file_incoming](
	[relative_dir] [varchar](255) NOT NULL,
	[file_name] [varchar](128) NOT NULL,
	[last_event_type] [char](1) NOT NULL,
	[node_id] [varchar](50) NOT NULL,
	[file_modified_time] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[relative_dir] ASC,
	[file_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_extract_request]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_extract_request](
	[request_id] [bigint] NOT NULL,
	[node_id] [varchar](50) NOT NULL,
	[queue] [varchar](128) NULL,
	[status] [char](2) NULL,
	[start_batch_id] [bigint] NOT NULL,
	[end_batch_id] [bigint] NOT NULL,
	[trigger_id] [varchar](128) NOT NULL,
	[router_id] [varchar](50) NOT NULL,
	[load_id] [bigint] NULL,
	[table_name] [varchar](255) NULL,
	[extracted_rows] [bigint] NOT NULL,
	[extracted_millis] [bigint] NOT NULL,
	[transferred_rows] [bigint] NOT NULL,
	[transferred_millis] [bigint] NOT NULL,
	[last_transferred_batch_id] [bigint] NULL,
	[loaded_rows] [bigint] NOT NULL,
	[loaded_millis] [bigint] NOT NULL,
	[last_loaded_batch_id] [bigint] NULL,
	[total_rows] [bigint] NULL,
	[loaded_time] [datetime2](7) NULL,
	[parent_request_id] [bigint] NOT NULL,
	[last_update_time] [datetime2](7) NULL,
	[create_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[request_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_trigger_hist]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_trigger_hist](
	[trigger_hist_id] [int] NOT NULL,
	[trigger_id] [varchar](128) NOT NULL,
	[source_table_name] [varchar](255) NOT NULL,
	[source_catalog_name] [varchar](255) NULL,
	[source_schema_name] [varchar](255) NULL,
	[name_for_update_trigger] [varchar](255) NULL,
	[name_for_insert_trigger] [varchar](255) NULL,
	[name_for_delete_trigger] [varchar](255) NULL,
	[table_hash] [bigint] NOT NULL,
	[trigger_row_hash] [bigint] NOT NULL,
	[trigger_template_hash] [bigint] NOT NULL,
	[column_names] [text] NOT NULL,
	[pk_column_names] [text] NOT NULL,
	[last_trigger_build_reason] [char](1) NOT NULL,
	[error_message] [text] NULL,
	[create_time] [datetime2](7) NOT NULL,
	[inactive_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[trigger_hist_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[sym_base64_encode]    Script Date: 06/13/2019 21:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[sym_base64_encode](@data varbinary(max)) returns varchar(max)                                                                                                                         
  with schemabinding, returns null on null input                                                                                                                       
  begin                                                                                                                                                                
    return ( select [text()] = @data for xml path('') )                                                                                                                
  end
GO
/****** Object:  Table [dbo].[sym_sequence]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_sequence](
	[sequence_name] [varchar](50) NOT NULL,
	[current_value] [bigint] NOT NULL,
	[increment_by] [int] NOT NULL,
	[min_value] [bigint] NOT NULL,
	[max_value] [bigint] NOT NULL,
	[cycle_flag] [smallint] NULL,
	[cache_size] [int] NOT NULL,
	[create_time] [datetime2](7) NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sequence_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_registration_request]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_registration_request](
	[node_group_id] [varchar](50) NOT NULL,
	[external_id] [varchar](255) NOT NULL,
	[status] [char](2) NOT NULL,
	[host_name] [varchar](60) NOT NULL,
	[ip_address] [varchar](50) NOT NULL,
	[attempt_count] [int] NULL,
	[registered_node_id] [varchar](50) NULL,
	[error_message] [text] NULL,
	[create_time] [datetime2](7) NOT NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[node_group_id] ASC,
	[external_id] ASC,
	[create_time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_registration_redirect]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_registration_redirect](
	[registrant_external_id] [varchar](255) NOT NULL,
	[registration_node_id] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[registrant_external_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_table_reload_status]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_table_reload_status](
	[load_id] [bigint] NOT NULL,
	[source_node_id] [varchar](50) NOT NULL,
	[target_node_id] [varchar](50) NOT NULL,
	[start_time] [datetime2](7) NULL,
	[end_time] [datetime2](7) NULL,
	[completed] [smallint] NOT NULL,
	[cancelled] [smallint] NOT NULL,
	[start_data_batch_id] [bigint] NULL,
	[end_data_batch_id] [bigint] NULL,
	[setup_batch_count] [bigint] NOT NULL,
	[data_batch_count] [bigint] NOT NULL,
	[finalize_batch_count] [bigint] NOT NULL,
	[setup_batch_loaded] [bigint] NOT NULL,
	[data_batch_loaded] [bigint] NOT NULL,
	[finalize_batch_loaded] [bigint] NOT NULL,
	[table_count] [bigint] NOT NULL,
	[rows_loaded] [bigint] NOT NULL,
	[rows_count] [bigint] NOT NULL,
	[error_flag] [smallint] NOT NULL,
	[sql_state] [varchar](10) NULL,
	[sql_code] [int] NOT NULL,
	[sql_message] [text] NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[load_id] ASC,
	[source_node_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[sym_triggers_disabled]    Script Date: 06/13/2019 21:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[sym_triggers_disabled]() returns smallint                                                                                                                                                 
  begin                                                                                                                                                                  
    declare @disabled varchar(1);                                                                                                                                        
    set @disabled = coalesce(replace(substring(cast(context_info() as varchar), 1, 1), 0x0, ''), '');                                                                    
    if @disabled is null or @disabled != '1'                                                                                                                             
      return 0;                                                                                                                                                          
    return 1;                                                                                                                                                            
  end
GO
/****** Object:  Table [dbo].[sym_data_gap]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_data_gap](
	[start_id] [bigint] NOT NULL,
	[end_id] [bigint] NOT NULL,
	[create_time] [datetime2](7) NOT NULL,
	[last_update_hostname] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[start_id] ASC,
	[end_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_data_event]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_data_event](
	[data_id] [bigint] NOT NULL,
	[batch_id] [bigint] NOT NULL,
	[router_id] [varchar](50) NOT NULL,
	[create_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[data_id] ASC,
	[batch_id] ASC,
	[router_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[sym_data_event] SET (LOCK_ESCALATION = DISABLE)
GO
/****** Object:  Table [dbo].[sym_data]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_data](
	[data_id] [bigint] IDENTITY(1,1) NOT NULL,
	[table_name] [varchar](255) NOT NULL,
	[event_type] [char](1) NOT NULL,
	[row_data] [text] NULL,
	[pk_data] [text] NULL,
	[old_data] [text] NULL,
	[trigger_hist_id] [int] NOT NULL,
	[channel_id] [varchar](128) NULL,
	[transaction_id] [varchar](255) NULL,
	[source_node_id] [varchar](50) NULL,
	[external_data] [varchar](50) NULL,
	[node_list] [varchar](255) NULL,
	[is_prerouted] [smallint] NOT NULL,
	[create_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[data_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[sym_data] SET (LOCK_ESCALATION = DISABLE)
GO
/****** Object:  Table [dbo].[sym_context]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_context](
	[name] [varchar](80) NOT NULL,
	[context_value] [text] NULL,
	[create_time] [datetime2](7) NULL,
	[last_update_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[sym_node_disabled]    Script Date: 06/13/2019 21:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[sym_node_disabled]() returns varchar(50)                                                                                                                                              
  begin                                                                                                                                                                  
    declare @node varchar(50);                                                                                                                                           
    set @node = coalesce(replace(substring(cast(context_info() as varchar) collate SQL_Latin1_General_CP1_CI_AS, 2, 50), 0x0, ''), '');                                  
    return @node;                                                                                                                                                        
  end
GO
/****** Object:  Table [dbo].[sym_node_communication]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_node_communication](
	[node_id] [varchar](50) NOT NULL,
	[queue] [varchar](25) NOT NULL,
	[communication_type] [varchar](10) NOT NULL,
	[lock_time] [datetime2](7) NULL,
	[locking_server_id] [varchar](255) NULL,
	[last_lock_time] [datetime2](7) NULL,
	[last_lock_millis] [bigint] NULL,
	[success_count] [bigint] NULL,
	[fail_count] [bigint] NULL,
	[skip_count] [bigint] NULL,
	[total_success_count] [bigint] NULL,
	[total_fail_count] [bigint] NULL,
	[total_success_millis] [bigint] NULL,
	[total_fail_millis] [bigint] NULL,
	[batch_to_send_count] [bigint] NULL,
	[node_priority] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[node_id] ASC,
	[queue] ASC,
	[communication_type] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_node_channel_ctl]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_node_channel_ctl](
	[node_id] [varchar](50) NOT NULL,
	[channel_id] [varchar](128) NOT NULL,
	[suspend_enabled] [smallint] NULL,
	[ignore_enabled] [smallint] NULL,
	[last_extract_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[node_id] ASC,
	[channel_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_node]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_node](
	[node_id] [varchar](50) NOT NULL,
	[node_group_id] [varchar](50) NOT NULL,
	[external_id] [varchar](255) NOT NULL,
	[sync_enabled] [smallint] NULL,
	[sync_url] [varchar](255) NULL,
	[schema_version] [varchar](50) NULL,
	[symmetric_version] [varchar](50) NULL,
	[config_version] [varchar](50) NULL,
	[database_type] [varchar](50) NULL,
	[database_version] [varchar](50) NULL,
	[batch_to_send_count] [int] NULL,
	[batch_in_error_count] [int] NULL,
	[created_at_node_id] [varchar](50) NULL,
	[deployment_type] [varchar](50) NULL,
	[deployment_sub_type] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[node_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_content_category]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_content_category](
	[id] [bigint] NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_content_category', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_content_category', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容分类' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_content_category'
GO
/****** Object:  Table [dbo].[tb_content]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_content](
	[id] [bigint] NOT NULL,
	[category_id] [bigint] NOT NULL,
	[title] [nvarchar](200) NULL,
	[url] [nvarchar](500) NULL,
	[pic] [nvarchar](300) NULL,
	[status] [nvarchar](1) NULL,
	[sort_order] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容类目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_content', @level2type=N'COLUMN',@level2name=N'category_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_content', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_content', @level2type=N'COLUMN',@level2name=N'url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片绝对路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_content', @level2type=N'COLUMN',@level2name=N'pic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_content', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_content', @level2type=N'COLUMN',@level2name=N'sort_order'
GO
/****** Object:  Table [dbo].[tb_branch]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_branch](
	[id] [bigint] NOT NULL,
	[name] [nvarchar](255) NULL,
	[first_char] [nvarchar](1) NULL,
	[phone] [int] NULL,
	[email] [nvarchar](22) NULL,
	[password] [nvarchar](64) NULL,
	[otherone] [nvarchar](255) NULL,
	[othertwo] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'院系名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_branch', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'院系首字母' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_branch', @level2type=N'COLUMN',@level2name=N'first_char'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_branch', @level2type=N'COLUMN',@level2name=N'phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_branch', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_branch', @level2type=N'COLUMN',@level2name=N'password'
GO
/****** Object:  Table [dbo].[tb_teacher]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_teacher](
	[id] [bigint] NOT NULL,
	[name] [nvarchar](255) NULL,
	[nplace] [nvarchar](255) NULL,
	[sex] [nvarchar](2) NULL,
	[phone] [nvarchar](20) NULL,
	[education] [nvarchar](20) NULL,
	[id_card] [nvarchar](50) NULL,
	[position] [nvarchar](10) NULL,
	[image] [nvarchar](255) NULL,
	[bid] [nvarchar](255) NULL,
	[password] [nvarchar](64) NULL,
	[bname] [nvarchar](300) NULL,
	[otherone] [nvarchar](300) NULL,
	[othertwo] [nvarchar](100) NULL,
	[otherthree] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'教师编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_teacher', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_teacher', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'籍贯' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_teacher', @level2type=N'COLUMN',@level2name=N'nplace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_teacher', @level2type=N'COLUMN',@level2name=N'sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_teacher', @level2type=N'COLUMN',@level2name=N'phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学历' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_teacher', @level2type=N'COLUMN',@level2name=N'education'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_teacher', @level2type=N'COLUMN',@level2name=N'id_card'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_teacher', @level2type=N'COLUMN',@level2name=N'position'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'照片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_teacher', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'院ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_teacher', @level2type=N'COLUMN',@level2name=N'bid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_teacher', @level2type=N'COLUMN',@level2name=N'password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'院名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_teacher', @level2type=N'COLUMN',@level2name=N'bname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'补充' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_teacher', @level2type=N'COLUMN',@level2name=N'otherone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_teacher', @level2type=N'COLUMN',@level2name=N'othertwo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_teacher', @level2type=N'COLUMN',@level2name=N'otherthree'
GO
/****** Object:  Table [dbo].[tb_student]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_student](
	[id] [bigint] NOT NULL,
	[name] [nvarchar](25) NULL,
	[id_card] [nvarchar](50) NULL,
	[nplace] [nvarchar](20) NULL,
	[sex] [nvarchar](2) NULL,
	[phone] [nvarchar](20) NULL,
	[education] [nvarchar](20) NULL,
	[stu_class] [nvarchar](255) NULL,
	[bid] [bigint] NULL,
	[image] [nvarchar](255) NULL,
	[bname] [nvarchar](255) NULL,
	[othertwo] [nvarchar](255) NULL,
	[password] [nvarchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学生id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_student', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学生名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_student', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_student', @level2type=N'COLUMN',@level2name=N'id_card'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'籍贯' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_student', @level2type=N'COLUMN',@level2name=N'nplace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_student', @level2type=N'COLUMN',@level2name=N'sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_student', @level2type=N'COLUMN',@level2name=N'phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学历' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_student', @level2type=N'COLUMN',@level2name=N'education'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_student', @level2type=N'COLUMN',@level2name=N'stu_class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学院ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_student', @level2type=N'COLUMN',@level2name=N'bid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'照片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_student', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学院名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_student', @level2type=N'COLUMN',@level2name=N'bname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_student', @level2type=N'COLUMN',@level2name=N'password'
GO
/****** Object:  Table [dbo].[sym_table_reload_request]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_table_reload_request](
	[target_node_id] [varchar](50) NOT NULL,
	[source_node_id] [varchar](50) NOT NULL,
	[trigger_id] [varchar](128) NOT NULL,
	[router_id] [varchar](50) NOT NULL,
	[create_time] [datetime2](7) NOT NULL,
	[create_table] [smallint] NOT NULL,
	[delete_first] [smallint] NOT NULL,
	[reload_select] [text] NULL,
	[before_custom_sql] [text] NULL,
	[reload_time] [datetime2](7) NULL,
	[load_id] [bigint] NULL,
	[processed] [smallint] NOT NULL,
	[channel_id] [varchar](128) NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[target_node_id] ASC,
	[source_node_id] ASC,
	[trigger_id] ASC,
	[router_id] ASC,
	[create_time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_parameter]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_parameter](
	[external_id] [varchar](255) NOT NULL,
	[node_group_id] [varchar](50) NOT NULL,
	[param_key] [varchar](80) NOT NULL,
	[param_value] [text] NULL,
	[create_time] [datetime2](7) NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[external_id] ASC,
	[node_group_id] ASC,
	[param_key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_transform_column]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_transform_column](
	[transform_id] [varchar](50) NOT NULL,
	[include_on] [char](1) NOT NULL,
	[target_column_name] [varchar](128) NOT NULL,
	[source_column_name] [varchar](128) NULL,
	[pk] [smallint] NULL,
	[transform_type] [varchar](50) NULL,
	[transform_expression] [text] NULL,
	[transform_order] [int] NOT NULL,
	[create_time] [datetime2](7) NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[transform_id] ASC,
	[include_on] ASC,
	[target_column_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_file_trigger]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_file_trigger](
	[trigger_id] [varchar](128) NOT NULL,
	[channel_id] [varchar](128) NOT NULL,
	[reload_channel_id] [varchar](128) NOT NULL,
	[base_dir] [varchar](255) NOT NULL,
	[recurse] [smallint] NOT NULL,
	[includes_files] [varchar](255) NULL,
	[excludes_files] [varchar](255) NULL,
	[sync_on_create] [smallint] NOT NULL,
	[sync_on_modified] [smallint] NOT NULL,
	[sync_on_delete] [smallint] NOT NULL,
	[sync_on_ctl_file] [smallint] NOT NULL,
	[delete_after_sync] [smallint] NOT NULL,
	[before_copy_script] [text] NULL,
	[after_copy_script] [text] NULL,
	[create_time] [datetime2](7) NOT NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NOT NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[trigger_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_channel]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_channel](
	[channel_id] [varchar](128) NOT NULL,
	[processing_order] [int] NOT NULL,
	[max_batch_size] [int] NOT NULL,
	[max_batch_to_send] [int] NOT NULL,
	[max_data_to_route] [int] NOT NULL,
	[extract_period_millis] [int] NOT NULL,
	[enabled] [smallint] NOT NULL,
	[use_old_data_to_route] [smallint] NOT NULL,
	[use_row_data_to_route] [smallint] NOT NULL,
	[use_pk_data_to_route] [smallint] NOT NULL,
	[reload_flag] [smallint] NOT NULL,
	[file_sync_flag] [smallint] NOT NULL,
	[contains_big_lob] [smallint] NOT NULL,
	[batch_algorithm] [varchar](50) NOT NULL,
	[data_loader_type] [varchar](50) NOT NULL,
	[description] [varchar](255) NULL,
	[queue] [varchar](25) NOT NULL,
	[max_network_kbps] [decimal](10, 3) NOT NULL,
	[data_event_action] [char](1) NULL,
	[create_time] [datetime2](7) NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[channel_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_extension]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_extension](
	[extension_id] [varchar](50) NOT NULL,
	[extension_type] [varchar](10) NOT NULL,
	[interface_name] [varchar](255) NULL,
	[node_group_id] [varchar](50) NOT NULL,
	[enabled] [smallint] NOT NULL,
	[extension_order] [int] NOT NULL,
	[extension_text] [text] NULL,
	[create_time] [datetime2](7) NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[extension_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_grouplet]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_grouplet](
	[grouplet_id] [varchar](50) NOT NULL,
	[grouplet_link_policy] [char](1) NOT NULL,
	[description] [varchar](255) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[grouplet_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_load_filter]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_load_filter](
	[load_filter_id] [varchar](50) NOT NULL,
	[load_filter_type] [varchar](10) NOT NULL,
	[source_node_group_id] [varchar](50) NOT NULL,
	[target_node_group_id] [varchar](50) NOT NULL,
	[target_catalog_name] [varchar](255) NULL,
	[target_schema_name] [varchar](255) NULL,
	[target_table_name] [varchar](255) NULL,
	[filter_on_update] [smallint] NOT NULL,
	[filter_on_insert] [smallint] NOT NULL,
	[filter_on_delete] [smallint] NOT NULL,
	[before_write_script] [text] NULL,
	[after_write_script] [text] NULL,
	[batch_complete_script] [text] NULL,
	[batch_commit_script] [text] NULL,
	[batch_rollback_script] [text] NULL,
	[handle_error_script] [text] NULL,
	[create_time] [datetime2](7) NOT NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NOT NULL,
	[load_filter_order] [int] NOT NULL,
	[fail_on_error] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[load_filter_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_job]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_job](
	[job_name] [varchar](50) NOT NULL,
	[job_type] [varchar](10) NOT NULL,
	[requires_registration] [smallint] NOT NULL,
	[job_expression] [text] NULL,
	[description] [varchar](255) NULL,
	[default_schedule] [varchar](50) NULL,
	[default_auto_start] [smallint] NOT NULL,
	[node_group_id] [varchar](50) NOT NULL,
	[create_by] [varchar](50) NULL,
	[create_time] [datetime2](7) NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[job_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_node_host]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_node_host](
	[node_id] [varchar](50) NOT NULL,
	[host_name] [varchar](60) NOT NULL,
	[instance_id] [varchar](60) NULL,
	[ip_address] [varchar](50) NULL,
	[os_user] [varchar](50) NULL,
	[os_name] [varchar](50) NULL,
	[os_arch] [varchar](50) NULL,
	[os_version] [varchar](50) NULL,
	[available_processors] [int] NULL,
	[free_memory_bytes] [bigint] NULL,
	[total_memory_bytes] [bigint] NULL,
	[max_memory_bytes] [bigint] NULL,
	[java_version] [varchar](50) NULL,
	[java_vendor] [varchar](255) NULL,
	[jdbc_version] [varchar](255) NULL,
	[symmetric_version] [varchar](50) NULL,
	[timezone_offset] [varchar](6) NULL,
	[heartbeat_time] [datetime2](7) NULL,
	[last_restart_time] [datetime2](7) NOT NULL,
	[create_time] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[node_id] ASC,
	[host_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_node_group_channel_wnd]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_node_group_channel_wnd](
	[node_group_id] [varchar](50) NOT NULL,
	[channel_id] [varchar](128) NOT NULL,
	[start_time] [datetime2](7) NOT NULL,
	[end_time] [datetime2](7) NOT NULL,
	[enabled] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[node_group_id] ASC,
	[channel_id] ASC,
	[start_time] ASC,
	[end_time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_node_group]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_node_group](
	[node_group_id] [varchar](50) NOT NULL,
	[description] [varchar](255) NULL,
	[create_time] [datetime2](7) NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[node_group_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_monitor]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_monitor](
	[monitor_id] [varchar](128) NOT NULL,
	[node_group_id] [varchar](50) NOT NULL,
	[external_id] [varchar](255) NOT NULL,
	[type] [varchar](50) NOT NULL,
	[expression] [text] NULL,
	[threshold] [bigint] NOT NULL,
	[run_period] [int] NOT NULL,
	[run_count] [int] NOT NULL,
	[severity_level] [int] NOT NULL,
	[enabled] [smallint] NOT NULL,
	[create_time] [datetime2](7) NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[monitor_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_notification]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_notification](
	[notification_id] [varchar](128) NOT NULL,
	[node_group_id] [varchar](50) NOT NULL,
	[external_id] [varchar](255) NOT NULL,
	[severity_level] [int] NOT NULL,
	[type] [varchar](50) NOT NULL,
	[expression] [text] NULL,
	[enabled] [smallint] NOT NULL,
	[create_time] [datetime2](7) NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[notification_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_datatime]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_datatime](
	[id] [bigint] NOT NULL,
	[data_time] [nvarchar](50) NULL,
	[data_onup] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_datatime', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_datatime', @level2type=N'COLUMN',@level2name=N'data_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上/下午' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_datatime', @level2type=N'COLUMN',@level2name=N'data_onup'
GO
/****** Object:  Table [dbo].[tb_faculty]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_faculty](
	[id] [bigint] NOT NULL,
	[name] [nvarchar](255) NULL,
	[first_char] [nvarchar](1) NULL,
	[phone] [int] NULL,
	[introduce] [nvarchar](3000) NULL,
	[email] [nvarchar](22) NULL,
	[bid] [bigint] NULL,
	[bid_spec] [nvarchar](50) NULL,
	[otherone] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_faculty', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_faculty', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系首字母' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_faculty', @level2type=N'COLUMN',@level2name=N'first_char'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_faculty', @level2type=N'COLUMN',@level2name=N'phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'介绍' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_faculty', @level2type=N'COLUMN',@level2name=N'introduce'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_faculty', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'院ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_faculty', @level2type=N'COLUMN',@level2name=N'bid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扩展字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_faculty', @level2type=N'COLUMN',@level2name=N'bid_spec'
GO
/****** Object:  Table [dbo].[tb_course]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_course](
	[id] [bigint] NOT NULL,
	[name] [nvarchar](25) NULL,
	[credit] [int] NULL,
	[tid] [bigint] NULL,
	[tname] [nvarchar](255) NULL,
	[otherone] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课程编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_course', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课程名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_course', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_course', @level2type=N'COLUMN',@level2name=N'credit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'教师ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_course', @level2type=N'COLUMN',@level2name=N'tid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'教师名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_course', @level2type=N'COLUMN',@level2name=N'tname'
GO
/****** Object:  Table [dbo].[sym_node_security]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_node_security](
	[node_id] [varchar](50) NOT NULL,
	[node_password] [varchar](50) NOT NULL,
	[registration_enabled] [smallint] NULL,
	[registration_time] [datetime2](7) NULL,
	[initial_load_enabled] [smallint] NULL,
	[initial_load_time] [datetime2](7) NULL,
	[initial_load_id] [bigint] NULL,
	[initial_load_create_by] [varchar](255) NULL,
	[rev_initial_load_enabled] [smallint] NULL,
	[rev_initial_load_time] [datetime2](7) NULL,
	[rev_initial_load_id] [bigint] NULL,
	[rev_initial_load_create_by] [varchar](255) NULL,
	[created_at_node_id] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[node_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_node_identity]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_node_identity](
	[node_id] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[node_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_node_group_link]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_node_group_link](
	[source_node_group_id] [varchar](50) NOT NULL,
	[target_node_group_id] [varchar](50) NOT NULL,
	[data_event_action] [char](1) NOT NULL,
	[sync_config_enabled] [smallint] NOT NULL,
	[is_reversible] [smallint] NOT NULL,
	[create_time] [datetime2](7) NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[source_node_group_id] ASC,
	[target_node_group_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_grouplet_link]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_grouplet_link](
	[grouplet_id] [varchar](50) NOT NULL,
	[external_id] [varchar](255) NOT NULL,
	[create_time] [datetime2](7) NOT NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[grouplet_id] ASC,
	[external_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_trigger]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_trigger](
	[trigger_id] [varchar](128) NOT NULL,
	[source_catalog_name] [varchar](255) NULL,
	[source_schema_name] [varchar](255) NULL,
	[source_table_name] [varchar](255) NOT NULL,
	[channel_id] [varchar](128) NOT NULL,
	[reload_channel_id] [varchar](128) NOT NULL,
	[sync_on_update] [smallint] NOT NULL,
	[sync_on_insert] [smallint] NOT NULL,
	[sync_on_delete] [smallint] NOT NULL,
	[sync_on_incoming_batch] [smallint] NOT NULL,
	[name_for_update_trigger] [varchar](255) NULL,
	[name_for_insert_trigger] [varchar](255) NULL,
	[name_for_delete_trigger] [varchar](255) NULL,
	[sync_on_update_condition] [text] NULL,
	[sync_on_insert_condition] [text] NULL,
	[sync_on_delete_condition] [text] NULL,
	[custom_before_update_text] [text] NULL,
	[custom_before_insert_text] [text] NULL,
	[custom_before_delete_text] [text] NULL,
	[custom_on_update_text] [text] NULL,
	[custom_on_insert_text] [text] NULL,
	[custom_on_delete_text] [text] NULL,
	[external_select] [text] NULL,
	[tx_id_expression] [text] NULL,
	[channel_expression] [text] NULL,
	[excluded_column_names] [text] NULL,
	[included_column_names] [text] NULL,
	[sync_key_names] [text] NULL,
	[use_stream_lobs] [smallint] NOT NULL,
	[use_capture_lobs] [smallint] NOT NULL,
	[use_capture_old_data] [smallint] NOT NULL,
	[use_handle_key_updates] [smallint] NOT NULL,
	[stream_row] [smallint] NOT NULL,
	[create_time] [datetime2](7) NOT NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NOT NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[trigger_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_conflict]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_conflict](
	[conflict_id] [varchar](50) NOT NULL,
	[source_node_group_id] [varchar](50) NOT NULL,
	[target_node_group_id] [varchar](50) NOT NULL,
	[target_channel_id] [varchar](128) NULL,
	[target_catalog_name] [varchar](255) NULL,
	[target_schema_name] [varchar](255) NULL,
	[target_table_name] [varchar](255) NULL,
	[detect_type] [varchar](128) NOT NULL,
	[detect_expression] [text] NULL,
	[resolve_type] [varchar](128) NOT NULL,
	[ping_back] [varchar](128) NOT NULL,
	[resolve_changes_only] [smallint] NULL,
	[resolve_row_only] [smallint] NULL,
	[create_time] [datetime2](7) NOT NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[conflict_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_sc]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_sc](
	[id] [bigint] NOT NULL,
	[cid] [bigint] NULL,
	[sid] [bigint] NULL,
	[grade] [nvarchar](100) NULL,
	[s_spec] [nvarchar](100) NULL,
	[c_spec] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'选课ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_sc', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课程id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_sc', @level2type=N'COLUMN',@level2name=N'cid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学生id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_sc', @level2type=N'COLUMN',@level2name=N'sid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成绩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_sc', @level2type=N'COLUMN',@level2name=N'grade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扩展1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_sc', @level2type=N'COLUMN',@level2name=N's_spec'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扩展2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_sc', @level2type=N'COLUMN',@level2name=N'c_spec'
GO
/****** Object:  Table [dbo].[sym_router]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_router](
	[router_id] [varchar](50) NOT NULL,
	[target_catalog_name] [varchar](255) NULL,
	[target_schema_name] [varchar](255) NULL,
	[target_table_name] [varchar](255) NULL,
	[source_node_group_id] [varchar](50) NOT NULL,
	[target_node_group_id] [varchar](50) NOT NULL,
	[router_type] [varchar](50) NULL,
	[router_expression] [text] NULL,
	[sync_on_update] [smallint] NOT NULL,
	[sync_on_insert] [smallint] NOT NULL,
	[sync_on_delete] [smallint] NOT NULL,
	[use_source_catalog_schema] [smallint] NOT NULL,
	[create_time] [datetime2](7) NOT NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NOT NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[router_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_transform_table]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_transform_table](
	[transform_id] [varchar](50) NOT NULL,
	[source_node_group_id] [varchar](50) NOT NULL,
	[target_node_group_id] [varchar](50) NOT NULL,
	[transform_point] [varchar](10) NOT NULL,
	[source_catalog_name] [varchar](255) NULL,
	[source_schema_name] [varchar](255) NULL,
	[source_table_name] [varchar](255) NOT NULL,
	[target_catalog_name] [varchar](255) NULL,
	[target_schema_name] [varchar](255) NULL,
	[target_table_name] [varchar](255) NULL,
	[update_first] [smallint] NULL,
	[update_action] [varchar](255) NOT NULL,
	[delete_action] [varchar](10) NOT NULL,
	[transform_order] [int] NOT NULL,
	[column_policy] [varchar](10) NOT NULL,
	[create_time] [datetime2](7) NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[transform_id] ASC,
	[source_node_group_id] ASC,
	[target_node_group_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_file_trigger_router]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_file_trigger_router](
	[trigger_id] [varchar](128) NOT NULL,
	[router_id] [varchar](50) NOT NULL,
	[enabled] [smallint] NOT NULL,
	[initial_load_enabled] [smallint] NOT NULL,
	[target_base_dir] [varchar](255) NULL,
	[conflict_strategy] [varchar](128) NOT NULL,
	[create_time] [datetime2](7) NOT NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NOT NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[trigger_id] ASC,
	[router_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_trigger_router]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_trigger_router](
	[trigger_id] [varchar](128) NOT NULL,
	[router_id] [varchar](50) NOT NULL,
	[enabled] [smallint] NOT NULL,
	[initial_load_order] [int] NOT NULL,
	[initial_load_select] [text] NULL,
	[initial_load_delete_stmt] [text] NULL,
	[ping_back_enabled] [smallint] NOT NULL,
	[create_time] [datetime2](7) NOT NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NOT NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[trigger_id] ASC,
	[router_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sym_trigger_router_grouplet]    Script Date: 06/13/2019 21:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sym_trigger_router_grouplet](
	[grouplet_id] [varchar](50) NOT NULL,
	[trigger_id] [varchar](128) NOT NULL,
	[router_id] [varchar](50) NOT NULL,
	[applies_when] [char](1) NOT NULL,
	[create_time] [datetime2](7) NOT NULL,
	[last_update_by] [varchar](50) NULL,
	[last_update_time] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[grouplet_id] ASC,
	[trigger_id] ASC,
	[router_id] ASC,
	[applies_when] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF__sym_chann__proce__276EDEB3]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_channel] ADD  DEFAULT ((1)) FOR [processing_order]
GO
/****** Object:  Default [DF__sym_chann__max_b__286302EC]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_channel] ADD  DEFAULT ((1000)) FOR [max_batch_size]
GO
/****** Object:  Default [DF__sym_chann__max_b__29572725]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_channel] ADD  DEFAULT ((60)) FOR [max_batch_to_send]
GO
/****** Object:  Default [DF__sym_chann__max_d__2A4B4B5E]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_channel] ADD  DEFAULT ((100000)) FOR [max_data_to_route]
GO
/****** Object:  Default [DF__sym_chann__extra__2B3F6F97]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_channel] ADD  DEFAULT ((0)) FOR [extract_period_millis]
GO
/****** Object:  Default [DF__sym_chann__enabl__2C3393D0]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_channel] ADD  DEFAULT ((1)) FOR [enabled]
GO
/****** Object:  Default [DF__sym_chann__use_o__2D27B809]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_channel] ADD  DEFAULT ((1)) FOR [use_old_data_to_route]
GO
/****** Object:  Default [DF__sym_chann__use_r__2E1BDC42]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_channel] ADD  DEFAULT ((1)) FOR [use_row_data_to_route]
GO
/****** Object:  Default [DF__sym_chann__use_p__2F10007B]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_channel] ADD  DEFAULT ((1)) FOR [use_pk_data_to_route]
GO
/****** Object:  Default [DF__sym_chann__reloa__300424B4]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_channel] ADD  DEFAULT ((0)) FOR [reload_flag]
GO
/****** Object:  Default [DF__sym_chann__file___30F848ED]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_channel] ADD  DEFAULT ((0)) FOR [file_sync_flag]
GO
/****** Object:  Default [DF__sym_chann__conta__31EC6D26]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_channel] ADD  DEFAULT ((0)) FOR [contains_big_lob]
GO
/****** Object:  Default [DF__sym_chann__batch__32E0915F]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_channel] ADD  DEFAULT ('default') FOR [batch_algorithm]
GO
/****** Object:  Default [DF__sym_chann__data___33D4B598]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_channel] ADD  DEFAULT ('default') FOR [data_loader_type]
GO
/****** Object:  Default [DF__sym_chann__queue__34C8D9D1]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_channel] ADD  DEFAULT ('default') FOR [queue]
GO
/****** Object:  Default [DF__sym_chann__max_n__35BCFE0A]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_channel] ADD  DEFAULT ((0.000)) FOR [max_network_kbps]
GO
/****** Object:  Default [DF__sym_confl__resol__3A81B327]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_conflict] ADD  DEFAULT ((0)) FOR [resolve_changes_only]
GO
/****** Object:  Default [DF__sym_confl__resol__3B75D760]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_conflict] ADD  DEFAULT ((0)) FOR [resolve_row_only]
GO
/****** Object:  Default [DF__sym_data__is_pre__440B1D61]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_data] ADD  DEFAULT ((0)) FOR [is_prerouted]
GO
/****** Object:  Default [DF__sym_exten__enabl__5070F446]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_extension] ADD  DEFAULT ((1)) FOR [enabled]
GO
/****** Object:  Default [DF__sym_exten__exten__5165187F]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_extension] ADD  DEFAULT ((1)) FOR [extension_order]
GO
/****** Object:  Default [DF__sym_extra__extra__5629CD9C]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_extract_request] ADD  DEFAULT ((0)) FOR [extracted_rows]
GO
/****** Object:  Default [DF__sym_extra__extra__571DF1D5]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_extract_request] ADD  DEFAULT ((0)) FOR [extracted_millis]
GO
/****** Object:  Default [DF__sym_extra__trans__5812160E]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_extract_request] ADD  DEFAULT ((0)) FOR [transferred_rows]
GO
/****** Object:  Default [DF__sym_extra__trans__59063A47]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_extract_request] ADD  DEFAULT ((0)) FOR [transferred_millis]
GO
/****** Object:  Default [DF__sym_extra__loade__59FA5E80]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_extract_request] ADD  DEFAULT ((0)) FOR [loaded_rows]
GO
/****** Object:  Default [DF__sym_extra__loade__5AEE82B9]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_extract_request] ADD  DEFAULT ((0)) FOR [loaded_millis]
GO
/****** Object:  Default [DF__sym_extra__paren__5BE2A6F2]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_extract_request] ADD  DEFAULT ((0)) FOR [parent_request_id]
GO
/****** Object:  Default [DF__sym_file___chann__6477ECF3]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_file_snapshot] ADD  DEFAULT ('filesync') FOR [channel_id]
GO
/****** Object:  Default [DF__sym_file___reloa__656C112C]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_file_snapshot] ADD  DEFAULT ('filesync_reload') FOR [reload_channel_id]
GO
/****** Object:  Default [DF__sym_file___chann__6A30C649]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_file_trigger] ADD  DEFAULT ('filesync') FOR [channel_id]
GO
/****** Object:  Default [DF__sym_file___reloa__6B24EA82]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_file_trigger] ADD  DEFAULT ('filesync_reload') FOR [reload_channel_id]
GO
/****** Object:  Default [DF__sym_file___recur__6C190EBB]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_file_trigger] ADD  DEFAULT ((1)) FOR [recurse]
GO
/****** Object:  Default [DF__sym_file___sync___6D0D32F4]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_file_trigger] ADD  DEFAULT ((1)) FOR [sync_on_create]
GO
/****** Object:  Default [DF__sym_file___sync___6E01572D]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_file_trigger] ADD  DEFAULT ((1)) FOR [sync_on_modified]
GO
/****** Object:  Default [DF__sym_file___sync___6EF57B66]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_file_trigger] ADD  DEFAULT ((1)) FOR [sync_on_delete]
GO
/****** Object:  Default [DF__sym_file___sync___6FE99F9F]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_file_trigger] ADD  DEFAULT ((0)) FOR [sync_on_ctl_file]
GO
/****** Object:  Default [DF__sym_file___delet__70DDC3D8]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_file_trigger] ADD  DEFAULT ((0)) FOR [delete_after_sync]
GO
/****** Object:  Default [DF__sym_file___enabl__75A278F5]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_file_trigger_router] ADD  DEFAULT ((1)) FOR [enabled]
GO
/****** Object:  Default [DF__sym_file___initi__76969D2E]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_file_trigger_router] ADD  DEFAULT ((1)) FOR [initial_load_enabled]
GO
/****** Object:  Default [DF__sym_file___confl__778AC167]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_file_trigger_router] ADD  DEFAULT ('source_wins') FOR [conflict_strategy]
GO
/****** Object:  Default [DF__sym_group__group__7C4F7684]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_grouplet] ADD  DEFAULT ('I') FOR [grouplet_link_policy]
GO
/****** Object:  Default [DF__sym_incom__error__04E4BC85]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [error_flag]
GO
/****** Object:  Default [DF__sym_incom__sql_c__05D8E0BE]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [sql_code]
GO
/****** Object:  Default [DF__sym_incom__ignor__06CD04F7]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [ignore_count]
GO
/****** Object:  Default [DF__sym_incom__byte___07C12930]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [byte_count]
GO
/****** Object:  Default [DF__sym_incom__load___08B54D69]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [load_flag]
GO
/****** Object:  Default [DF__sym_incom__extra__09A971A2]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [extract_count]
GO
/****** Object:  Default [DF__sym_incom__sent___0A9D95DB]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [sent_count]
GO
/****** Object:  Default [DF__sym_incom__load___0B91BA14]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [load_count]
GO
/****** Object:  Default [DF__sym_incom__reloa__0C85DE4D]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [reload_row_count]
GO
/****** Object:  Default [DF__sym_incom__other__0D7A0286]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [other_row_count]
GO
/****** Object:  Default [DF__sym_incom__data___0E6E26BF]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [data_row_count]
GO
/****** Object:  Default [DF__sym_incom__extra__0F624AF8]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [extract_row_count]
GO
/****** Object:  Default [DF__sym_incom__load___10566F31]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [load_row_count]
GO
/****** Object:  Default [DF__sym_incom__data___114A936A]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [data_insert_row_count]
GO
/****** Object:  Default [DF__sym_incom__data___123EB7A3]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [data_update_row_count]
GO
/****** Object:  Default [DF__sym_incom__data___1332DBDC]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [data_delete_row_count]
GO
/****** Object:  Default [DF__sym_incom__extra__14270015]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [extract_insert_row_count]
GO
/****** Object:  Default [DF__sym_incom__extra__151B244E]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [extract_update_row_count]
GO
/****** Object:  Default [DF__sym_incom__extra__160F4887]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [extract_delete_row_count]
GO
/****** Object:  Default [DF__sym_incom__load___17036CC0]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [load_insert_row_count]
GO
/****** Object:  Default [DF__sym_incom__load___17F790F9]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [load_update_row_count]
GO
/****** Object:  Default [DF__sym_incom__load___18EBB532]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [load_delete_row_count]
GO
/****** Object:  Default [DF__sym_incom__netwo__19DFD96B]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [network_millis]
GO
/****** Object:  Default [DF__sym_incom__filte__1AD3FDA4]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [filter_millis]
GO
/****** Object:  Default [DF__sym_incom__load___1BC821DD]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [load_millis]
GO
/****** Object:  Default [DF__sym_incom__route__1CBC4616]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [router_millis]
GO
/****** Object:  Default [DF__sym_incom__extra__1DB06A4F]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [extract_millis]
GO
/****** Object:  Default [DF__sym_incom__trans__1EA48E88]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [transform_extract_millis]
GO
/****** Object:  Default [DF__sym_incom__trans__1F98B2C1]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [transform_load_millis]
GO
/****** Object:  Default [DF__sym_incom__commo__208CD6FA]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [common_flag]
GO
/****** Object:  Default [DF__sym_incom__fallb__2180FB33]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [fallback_insert_count]
GO
/****** Object:  Default [DF__sym_incom__fallb__22751F6C]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [fallback_update_count]
GO
/****** Object:  Default [DF__sym_incom__ignor__236943A5]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [ignore_row_count]
GO
/****** Object:  Default [DF__sym_incom__missi__245D67DE]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [missing_delete_count]
GO
/****** Object:  Default [DF__sym_incom__skip___25518C17]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [skip_count]
GO
/****** Object:  Default [DF__sym_incom__faile__2645B050]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [failed_row_number]
GO
/****** Object:  Default [DF__sym_incom__faile__2739D489]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [failed_line_number]
GO
/****** Object:  Default [DF__sym_incom__faile__282DF8C2]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_batch] ADD  DEFAULT ((0)) FOR [failed_data_id]
GO
/****** Object:  Default [DF__sym_incom__faile__2CF2ADDF]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_error] ADD  DEFAULT ((0)) FOR [failed_line_number]
GO
/****** Object:  Default [DF__sym_incom__binar__2DE6D218]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_error] ADD  DEFAULT ('HEX') FOR [binary_encoding]
GO
/****** Object:  Default [DF__sym_incom__resol__2EDAF651]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_incoming_error] ADD  DEFAULT ((0)) FOR [resolve_ignore]
GO
/****** Object:  Default [DF__sym_job__require__339FAB6E]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_job] ADD  DEFAULT ((1)) FOR [requires_registration]
GO
/****** Object:  Default [DF__sym_job__default__3493CFA7]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_job] ADD  DEFAULT ((1)) FOR [default_auto_start]
GO
/****** Object:  Default [DF__sym_load___filte__395884C4]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_load_filter] ADD  DEFAULT ((1)) FOR [filter_on_update]
GO
/****** Object:  Default [DF__sym_load___filte__3A4CA8FD]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_load_filter] ADD  DEFAULT ((1)) FOR [filter_on_insert]
GO
/****** Object:  Default [DF__sym_load___filte__3B40CD36]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_load_filter] ADD  DEFAULT ((1)) FOR [filter_on_delete]
GO
/****** Object:  Default [DF__sym_load___load___3C34F16F]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_load_filter] ADD  DEFAULT ((1)) FOR [load_filter_order]
GO
/****** Object:  Default [DF__sym_load___fail___3D2915A8]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_load_filter] ADD  DEFAULT ((0)) FOR [fail_on_error]
GO
/****** Object:  Default [DF__sym_lock__shared__41EDCAC5]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_lock] ADD  DEFAULT ((0)) FOR [shared_count]
GO
/****** Object:  Default [DF__sym_lock__shared__42E1EEFE]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_lock] ADD  DEFAULT ((0)) FOR [shared_enable]
GO
/****** Object:  Default [DF__sym_monit__node___2BC97F7C]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_monitor] ADD  DEFAULT ('ALL') FOR [node_group_id]
GO
/****** Object:  Default [DF__sym_monit__exter__2CBDA3B5]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_monitor] ADD  DEFAULT ('ALL') FOR [external_id]
GO
/****** Object:  Default [DF__sym_monit__thres__2DB1C7EE]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_monitor] ADD  DEFAULT ((0)) FOR [threshold]
GO
/****** Object:  Default [DF__sym_monit__run_p__2EA5EC27]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_monitor] ADD  DEFAULT ((0)) FOR [run_period]
GO
/****** Object:  Default [DF__sym_monit__run_c__2F9A1060]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_monitor] ADD  DEFAULT ((0)) FOR [run_count]
GO
/****** Object:  Default [DF__sym_monit__sever__308E3499]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_monitor] ADD  DEFAULT ((0)) FOR [severity_level]
GO
/****** Object:  Default [DF__sym_monit__enabl__318258D2]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_monitor] ADD  DEFAULT ((0)) FOR [enabled]
GO
/****** Object:  Default [DF__sym_monit__thres__36470DEF]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_monitor_event] ADD  DEFAULT ((0)) FOR [threshold]
GO
/****** Object:  Default [DF__sym_monit__event__373B3228]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_monitor_event] ADD  DEFAULT ((0)) FOR [event_value]
GO
/****** Object:  Default [DF__sym_monit__event__382F5661]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_monitor_event] ADD  DEFAULT ((0)) FOR [event_count]
GO
/****** Object:  Default [DF__sym_monit__sever__39237A9A]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_monitor_event] ADD  DEFAULT ((0)) FOR [severity_level]
GO
/****** Object:  Default [DF__sym_monit__is_re__3A179ED3]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_monitor_event] ADD  DEFAULT ((0)) FOR [is_resolved]
GO
/****** Object:  Default [DF__sym_monit__is_no__3B0BC30C]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_monitor_event] ADD  DEFAULT ((0)) FOR [is_notified]
GO
/****** Object:  Default [DF__sym_node__sync_e__47A6A41B]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node] ADD  DEFAULT ((0)) FOR [sync_enabled]
GO
/****** Object:  Default [DF__sym_node__batch___489AC854]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node] ADD  DEFAULT ((0)) FOR [batch_to_send_count]
GO
/****** Object:  Default [DF__sym_node__batch___498EEC8D]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node] ADD  DEFAULT ((0)) FOR [batch_in_error_count]
GO
/****** Object:  Default [DF__sym_node___suspe__5CA1C101]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_channel_ctl] ADD  DEFAULT ((0)) FOR [suspend_enabled]
GO
/****** Object:  Default [DF__sym_node___ignor__5D95E53A]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_channel_ctl] ADD  DEFAULT ((0)) FOR [ignore_enabled]
GO
/****** Object:  Default [DF__sym_node___queue__4E53A1AA]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_communication] ADD  DEFAULT ('default') FOR [queue]
GO
/****** Object:  Default [DF__sym_node___last___4F47C5E3]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_communication] ADD  DEFAULT ((0)) FOR [last_lock_millis]
GO
/****** Object:  Default [DF__sym_node___succe__503BEA1C]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_communication] ADD  DEFAULT ((0)) FOR [success_count]
GO
/****** Object:  Default [DF__sym_node___fail___51300E55]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_communication] ADD  DEFAULT ((0)) FOR [fail_count]
GO
/****** Object:  Default [DF__sym_node___skip___5224328E]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_communication] ADD  DEFAULT ((0)) FOR [skip_count]
GO
/****** Object:  Default [DF__sym_node___total__531856C7]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_communication] ADD  DEFAULT ((0)) FOR [total_success_count]
GO
/****** Object:  Default [DF__sym_node___total__540C7B00]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_communication] ADD  DEFAULT ((0)) FOR [total_fail_count]
GO
/****** Object:  Default [DF__sym_node___total__55009F39]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_communication] ADD  DEFAULT ((0)) FOR [total_success_millis]
GO
/****** Object:  Default [DF__sym_node___total__55F4C372]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_communication] ADD  DEFAULT ((0)) FOR [total_fail_millis]
GO
/****** Object:  Default [DF__sym_node___batch__56E8E7AB]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_communication] ADD  DEFAULT ((0)) FOR [batch_to_send_count]
GO
/****** Object:  Default [DF__sym_node___node___57DD0BE4]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_communication] ADD  DEFAULT ((0)) FOR [node_priority]
GO
/****** Object:  Default [DF__sym_node___enabl__662B2B3B]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_group_channel_wnd] ADD  DEFAULT ((0)) FOR [enabled]
GO
/****** Object:  Default [DF__sym_node___data___6AEFE058]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_group_link] ADD  DEFAULT ('W') FOR [data_event_action]
GO
/****** Object:  Default [DF__sym_node___sync___6BE40491]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_group_link] ADD  DEFAULT ((1)) FOR [sync_config_enabled]
GO
/****** Object:  Default [DF__sym_node___is_re__6CD828CA]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_group_link] ADD  DEFAULT ((0)) FOR [is_reversible]
GO
/****** Object:  Default [DF__sym_node___avail__719CDDE7]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host] ADD  DEFAULT ((0)) FOR [available_processors]
GO
/****** Object:  Default [DF__sym_node___free___72910220]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host] ADD  DEFAULT ((0)) FOR [free_memory_bytes]
GO
/****** Object:  Default [DF__sym_node___total__73852659]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host] ADD  DEFAULT ((0)) FOR [total_memory_bytes]
GO
/****** Object:  Default [DF__sym_node___max_m__74794A92]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host] ADD  DEFAULT ((0)) FOR [max_memory_bytes]
GO
/****** Object:  Default [DF__sym_node___data___793DFFAF]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_channel_stats] ADD  DEFAULT ((0)) FOR [data_routed]
GO
/****** Object:  Default [DF__sym_node___data___7A3223E8]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_channel_stats] ADD  DEFAULT ((0)) FOR [data_unrouted]
GO
/****** Object:  Default [DF__sym_node___data___7B264821]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_channel_stats] ADD  DEFAULT ((0)) FOR [data_event_inserted]
GO
/****** Object:  Default [DF__sym_node___data___7C1A6C5A]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_channel_stats] ADD  DEFAULT ((0)) FOR [data_extracted]
GO
/****** Object:  Default [DF__sym_node___data___7D0E9093]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_channel_stats] ADD  DEFAULT ((0)) FOR [data_bytes_extracted]
GO
/****** Object:  Default [DF__sym_node___data___7E02B4CC]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_channel_stats] ADD  DEFAULT ((0)) FOR [data_extracted_errors]
GO
/****** Object:  Default [DF__sym_node___data___7EF6D905]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_channel_stats] ADD  DEFAULT ((0)) FOR [data_bytes_sent]
GO
/****** Object:  Default [DF__sym_node___data___7FEAFD3E]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_channel_stats] ADD  DEFAULT ((0)) FOR [data_sent]
GO
/****** Object:  Default [DF__sym_node___data___00DF2177]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_channel_stats] ADD  DEFAULT ((0)) FOR [data_sent_errors]
GO
/****** Object:  Default [DF__sym_node___data___01D345B0]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_channel_stats] ADD  DEFAULT ((0)) FOR [data_loaded]
GO
/****** Object:  Default [DF__sym_node___data___02C769E9]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_channel_stats] ADD  DEFAULT ((0)) FOR [data_bytes_loaded]
GO
/****** Object:  Default [DF__sym_node___data___03BB8E22]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_channel_stats] ADD  DEFAULT ((0)) FOR [data_loaded_errors]
GO
/****** Object:  Default [DF__sym_node___data___04AFB25B]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_channel_stats] ADD  DEFAULT ((0)) FOR [data_loaded_outgoing]
GO
/****** Object:  Default [DF__sym_node___data___05A3D694]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_channel_stats] ADD  DEFAULT ((0)) FOR [data_bytes_loaded_outgoing]
GO
/****** Object:  Default [DF__sym_node___data___0697FACD]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_channel_stats] ADD  DEFAULT ((0)) FOR [data_loaded_outgoing_errors]
GO
/****** Object:  Default [DF__sym_node___proce__0B5CAFEA]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_job_stats] ADD  DEFAULT ((0)) FOR [processed_count]
GO
/****** Object:  Default [DF__sym_node___targe__0C50D423]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_job_stats] ADD  DEFAULT ((0)) FOR [target_node_count]
GO
/****** Object:  Default [DF__sym_node___resta__11158940]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_stats] ADD  DEFAULT ((0)) FOR [restarted]
GO
/****** Object:  Default [DF__sym_node___nodes__1209AD79]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_stats] ADD  DEFAULT ((0)) FOR [nodes_pulled]
GO
/****** Object:  Default [DF__sym_node___total__12FDD1B2]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_stats] ADD  DEFAULT ((0)) FOR [total_nodes_pull_time]
GO
/****** Object:  Default [DF__sym_node___nodes__13F1F5EB]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_stats] ADD  DEFAULT ((0)) FOR [nodes_pushed]
GO
/****** Object:  Default [DF__sym_node___total__14E61A24]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_stats] ADD  DEFAULT ((0)) FOR [total_nodes_push_time]
GO
/****** Object:  Default [DF__sym_node___nodes__15DA3E5D]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_stats] ADD  DEFAULT ((0)) FOR [nodes_rejected]
GO
/****** Object:  Default [DF__sym_node___nodes__16CE6296]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_stats] ADD  DEFAULT ((0)) FOR [nodes_registered]
GO
/****** Object:  Default [DF__sym_node___nodes__17C286CF]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_stats] ADD  DEFAULT ((0)) FOR [nodes_loaded]
GO
/****** Object:  Default [DF__sym_node___nodes__18B6AB08]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_stats] ADD  DEFAULT ((0)) FOR [nodes_disabled]
GO
/****** Object:  Default [DF__sym_node___purge__19AACF41]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_stats] ADD  DEFAULT ((0)) FOR [purged_data_rows]
GO
/****** Object:  Default [DF__sym_node___purge__1A9EF37A]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_stats] ADD  DEFAULT ((0)) FOR [purged_data_event_rows]
GO
/****** Object:  Default [DF__sym_node___purge__1B9317B3]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_stats] ADD  DEFAULT ((0)) FOR [purged_batch_outgoing_rows]
GO
/****** Object:  Default [DF__sym_node___purge__1C873BEC]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_host_stats] ADD  DEFAULT ((0)) FOR [purged_batch_incoming_rows]
GO
/****** Object:  Default [DF__sym_node___regis__251C81ED]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_security] ADD  DEFAULT ((0)) FOR [registration_enabled]
GO
/****** Object:  Default [DF__sym_node___initi__2610A626]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_security] ADD  DEFAULT ((0)) FOR [initial_load_enabled]
GO
/****** Object:  Default [DF__sym_node___rev_i__2704CA5F]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_security] ADD  DEFAULT ((0)) FOR [rev_initial_load_enabled]
GO
/****** Object:  Default [DF__sym_notif__node___3FD07829]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_notification] ADD  DEFAULT ('ALL') FOR [node_group_id]
GO
/****** Object:  Default [DF__sym_notif__exter__40C49C62]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_notification] ADD  DEFAULT ('ALL') FOR [external_id]
GO
/****** Object:  Default [DF__sym_notif__sever__41B8C09B]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_notification] ADD  DEFAULT ((0)) FOR [severity_level]
GO
/****** Object:  Default [DF__sym_notif__enabl__42ACE4D4]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_notification] ADD  DEFAULT ((0)) FOR [enabled]
GO
/****** Object:  Default [DF__sym_outgo__error__477199F1]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [error_flag]
GO
/****** Object:  Default [DF__sym_outgo__sql_c__4865BE2A]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [sql_code]
GO
/****** Object:  Default [DF__sym_outgo__ignor__4959E263]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [ignore_count]
GO
/****** Object:  Default [DF__sym_outgo__byte___4A4E069C]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [byte_count]
GO
/****** Object:  Default [DF__sym_outgo__load___4B422AD5]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [load_flag]
GO
/****** Object:  Default [DF__sym_outgo__extra__4C364F0E]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [extract_count]
GO
/****** Object:  Default [DF__sym_outgo__sent___4D2A7347]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [sent_count]
GO
/****** Object:  Default [DF__sym_outgo__load___4E1E9780]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [load_count]
GO
/****** Object:  Default [DF__sym_outgo__reloa__4F12BBB9]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [reload_row_count]
GO
/****** Object:  Default [DF__sym_outgo__other__5006DFF2]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [other_row_count]
GO
/****** Object:  Default [DF__sym_outgo__data___50FB042B]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [data_row_count]
GO
/****** Object:  Default [DF__sym_outgo__extra__51EF2864]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [extract_row_count]
GO
/****** Object:  Default [DF__sym_outgo__load___52E34C9D]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [load_row_count]
GO
/****** Object:  Default [DF__sym_outgo__data___53D770D6]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [data_insert_row_count]
GO
/****** Object:  Default [DF__sym_outgo__data___54CB950F]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [data_update_row_count]
GO
/****** Object:  Default [DF__sym_outgo__data___55BFB948]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [data_delete_row_count]
GO
/****** Object:  Default [DF__sym_outgo__extra__56B3DD81]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [extract_insert_row_count]
GO
/****** Object:  Default [DF__sym_outgo__extra__57A801BA]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [extract_update_row_count]
GO
/****** Object:  Default [DF__sym_outgo__extra__589C25F3]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [extract_delete_row_count]
GO
/****** Object:  Default [DF__sym_outgo__load___59904A2C]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [load_insert_row_count]
GO
/****** Object:  Default [DF__sym_outgo__load___5A846E65]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [load_update_row_count]
GO
/****** Object:  Default [DF__sym_outgo__load___5B78929E]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [load_delete_row_count]
GO
/****** Object:  Default [DF__sym_outgo__netwo__5C6CB6D7]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [network_millis]
GO
/****** Object:  Default [DF__sym_outgo__filte__5D60DB10]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [filter_millis]
GO
/****** Object:  Default [DF__sym_outgo__load___5E54FF49]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [load_millis]
GO
/****** Object:  Default [DF__sym_outgo__route__5F492382]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [router_millis]
GO
/****** Object:  Default [DF__sym_outgo__extra__603D47BB]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [extract_millis]
GO
/****** Object:  Default [DF__sym_outgo__trans__61316BF4]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [transform_extract_millis]
GO
/****** Object:  Default [DF__sym_outgo__trans__6225902D]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [transform_load_millis]
GO
/****** Object:  Default [DF__sym_outgo__commo__6319B466]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [common_flag]
GO
/****** Object:  Default [DF__sym_outgo__fallb__640DD89F]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [fallback_insert_count]
GO
/****** Object:  Default [DF__sym_outgo__fallb__6501FCD8]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [fallback_update_count]
GO
/****** Object:  Default [DF__sym_outgo__ignor__65F62111]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [ignore_row_count]
GO
/****** Object:  Default [DF__sym_outgo__missi__66EA454A]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [missing_delete_count]
GO
/****** Object:  Default [DF__sym_outgo__skip___67DE6983]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [skip_count]
GO
/****** Object:  Default [DF__sym_outgo__total__68D28DBC]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [total_extract_millis]
GO
/****** Object:  Default [DF__sym_outgo__total__69C6B1F5]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [total_load_millis]
GO
/****** Object:  Default [DF__sym_outgo__extra__6ABAD62E]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [extract_job_flag]
GO
/****** Object:  Default [DF__sym_outgo__faile__6BAEFA67]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [failed_data_id]
GO
/****** Object:  Default [DF__sym_outgo__faile__6CA31EA0]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_outgoing_batch] ADD  DEFAULT ((0)) FOR [failed_line_number]
GO
/****** Object:  Default [DF__sym_regis__attem__7908F585]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_registration_request] ADD  DEFAULT ((0)) FOR [attempt_count]
GO
/****** Object:  Default [DF__sym_route__sync___7DCDAAA2]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_router] ADD  DEFAULT ((1)) FOR [sync_on_update]
GO
/****** Object:  Default [DF__sym_route__sync___7EC1CEDB]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_router] ADD  DEFAULT ((1)) FOR [sync_on_insert]
GO
/****** Object:  Default [DF__sym_route__sync___7FB5F314]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_router] ADD  DEFAULT ((1)) FOR [sync_on_delete]
GO
/****** Object:  Default [DF__sym_route__use_s__00AA174D]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_router] ADD  DEFAULT ((1)) FOR [use_source_catalog_schema]
GO
/****** Object:  Default [DF__sym_seque__curre__056ECC6A]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_sequence] ADD  DEFAULT ((0)) FOR [current_value]
GO
/****** Object:  Default [DF__sym_seque__incre__0662F0A3]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_sequence] ADD  DEFAULT ((1)) FOR [increment_by]
GO
/****** Object:  Default [DF__sym_seque__min_v__075714DC]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_sequence] ADD  DEFAULT ((1)) FOR [min_value]
GO
/****** Object:  Default [DF__sym_seque__max_v__084B3915]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_sequence] ADD  DEFAULT ((9999999999.)) FOR [max_value]
GO
/****** Object:  Default [DF__sym_seque__cycle__093F5D4E]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_sequence] ADD  DEFAULT ((0)) FOR [cycle_flag]
GO
/****** Object:  Default [DF__sym_seque__cache__0A338187]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_sequence] ADD  DEFAULT ((0)) FOR [cache_size]
GO
/****** Object:  Default [DF__sym_table__creat__0EF836A4]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_table_reload_request] ADD  DEFAULT ((0)) FOR [create_table]
GO
/****** Object:  Default [DF__sym_table__delet__0FEC5ADD]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_table_reload_request] ADD  DEFAULT ((0)) FOR [delete_first]
GO
/****** Object:  Default [DF__sym_table__proce__10E07F16]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_table_reload_request] ADD  DEFAULT ((0)) FOR [processed]
GO
/****** Object:  Default [DF__sym_table__compl__15A53433]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_table_reload_status] ADD  DEFAULT ((0)) FOR [completed]
GO
/****** Object:  Default [DF__sym_table__cance__1699586C]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_table_reload_status] ADD  DEFAULT ((0)) FOR [cancelled]
GO
/****** Object:  Default [DF__sym_table__setup__178D7CA5]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_table_reload_status] ADD  DEFAULT ((0)) FOR [setup_batch_count]
GO
/****** Object:  Default [DF__sym_table__data___1881A0DE]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_table_reload_status] ADD  DEFAULT ((0)) FOR [data_batch_count]
GO
/****** Object:  Default [DF__sym_table__final__1975C517]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_table_reload_status] ADD  DEFAULT ((0)) FOR [finalize_batch_count]
GO
/****** Object:  Default [DF__sym_table__setup__1A69E950]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_table_reload_status] ADD  DEFAULT ((0)) FOR [setup_batch_loaded]
GO
/****** Object:  Default [DF__sym_table__data___1B5E0D89]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_table_reload_status] ADD  DEFAULT ((0)) FOR [data_batch_loaded]
GO
/****** Object:  Default [DF__sym_table__final__1C5231C2]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_table_reload_status] ADD  DEFAULT ((0)) FOR [finalize_batch_loaded]
GO
/****** Object:  Default [DF__sym_table__table__1D4655FB]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_table_reload_status] ADD  DEFAULT ((0)) FOR [table_count]
GO
/****** Object:  Default [DF__sym_table__rows___1E3A7A34]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_table_reload_status] ADD  DEFAULT ((0)) FOR [rows_loaded]
GO
/****** Object:  Default [DF__sym_table__rows___1F2E9E6D]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_table_reload_status] ADD  DEFAULT ((0)) FOR [rows_count]
GO
/****** Object:  Default [DF__sym_table__error__2022C2A6]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_table_reload_status] ADD  DEFAULT ((0)) FOR [error_flag]
GO
/****** Object:  Default [DF__sym_table__sql_c__2116E6DF]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_table_reload_status] ADD  DEFAULT ((0)) FOR [sql_code]
GO
/****** Object:  Default [DF__sym_trans__inclu__2D7CBDC4]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_transform_column] ADD  DEFAULT ('*') FOR [include_on]
GO
/****** Object:  Default [DF__sym_transfor__pk__2E70E1FD]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_transform_column] ADD  DEFAULT ((0)) FOR [pk]
GO
/****** Object:  Default [DF__sym_trans__trans__2F650636]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_transform_column] ADD  DEFAULT ('copy') FOR [transform_type]
GO
/****** Object:  Default [DF__sym_trans__trans__30592A6F]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_transform_column] ADD  DEFAULT ((1)) FOR [transform_order]
GO
/****** Object:  Default [DF__sym_trans__updat__25DB9BFC]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_transform_table] ADD  DEFAULT ((0)) FOR [update_first]
GO
/****** Object:  Default [DF__sym_trans__updat__26CFC035]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_transform_table] ADD  DEFAULT ('UPDATE_COL') FOR [update_action]
GO
/****** Object:  Default [DF__sym_trans__trans__27C3E46E]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_transform_table] ADD  DEFAULT ((1)) FOR [transform_order]
GO
/****** Object:  Default [DF__sym_trans__colum__28B808A7]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_transform_table] ADD  DEFAULT ('SPECIFIED') FOR [column_policy]
GO
/****** Object:  Default [DF__sym_trigg__reloa__351DDF8C]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_trigger] ADD  DEFAULT ('reload') FOR [reload_channel_id]
GO
/****** Object:  Default [DF__sym_trigg__sync___361203C5]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_trigger] ADD  DEFAULT ((1)) FOR [sync_on_update]
GO
/****** Object:  Default [DF__sym_trigg__sync___370627FE]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_trigger] ADD  DEFAULT ((1)) FOR [sync_on_insert]
GO
/****** Object:  Default [DF__sym_trigg__sync___37FA4C37]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_trigger] ADD  DEFAULT ((1)) FOR [sync_on_delete]
GO
/****** Object:  Default [DF__sym_trigg__sync___38EE7070]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_trigger] ADD  DEFAULT ((0)) FOR [sync_on_incoming_batch]
GO
/****** Object:  Default [DF__sym_trigg__use_s__39E294A9]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_trigger] ADD  DEFAULT ((0)) FOR [use_stream_lobs]
GO
/****** Object:  Default [DF__sym_trigg__use_c__3AD6B8E2]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_trigger] ADD  DEFAULT ((0)) FOR [use_capture_lobs]
GO
/****** Object:  Default [DF__sym_trigg__use_c__3BCADD1B]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_trigger] ADD  DEFAULT ((1)) FOR [use_capture_old_data]
GO
/****** Object:  Default [DF__sym_trigg__use_h__3CBF0154]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_trigger] ADD  DEFAULT ((1)) FOR [use_handle_key_updates]
GO
/****** Object:  Default [DF__sym_trigg__strea__3DB3258D]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_trigger] ADD  DEFAULT ((0)) FOR [stream_row]
GO
/****** Object:  Default [DF__sym_trigg__table__4277DAAA]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_trigger_hist] ADD  DEFAULT ((0)) FOR [table_hash]
GO
/****** Object:  Default [DF__sym_trigg__trigg__436BFEE3]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_trigger_hist] ADD  DEFAULT ((0)) FOR [trigger_row_hash]
GO
/****** Object:  Default [DF__sym_trigg__trigg__4460231C]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_trigger_hist] ADD  DEFAULT ((0)) FOR [trigger_template_hash]
GO
/****** Object:  Default [DF__sym_trigg__enabl__4924D839]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_trigger_router] ADD  DEFAULT ((1)) FOR [enabled]
GO
/****** Object:  Default [DF__sym_trigg__initi__4A18FC72]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_trigger_router] ADD  DEFAULT ((1)) FOR [initial_load_order]
GO
/****** Object:  Default [DF__sym_trigg__ping___4B0D20AB]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_trigger_router] ADD  DEFAULT ((0)) FOR [ping_back_enabled]
GO
/****** Object:  ForeignKey [sym_fk_cf_2_grp_lnk]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_conflict]  WITH CHECK ADD  CONSTRAINT [sym_fk_cf_2_grp_lnk] FOREIGN KEY([source_node_group_id], [target_node_group_id])
REFERENCES [dbo].[sym_node_group_link] ([source_node_group_id], [target_node_group_id])
GO
ALTER TABLE [dbo].[sym_conflict] CHECK CONSTRAINT [sym_fk_cf_2_grp_lnk]
GO
/****** Object:  ForeignKey [sym_fk_ftr_2_ftrg]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_file_trigger_router]  WITH CHECK ADD  CONSTRAINT [sym_fk_ftr_2_ftrg] FOREIGN KEY([trigger_id])
REFERENCES [dbo].[sym_file_trigger] ([trigger_id])
GO
ALTER TABLE [dbo].[sym_file_trigger_router] CHECK CONSTRAINT [sym_fk_ftr_2_ftrg]
GO
/****** Object:  ForeignKey [sym_fk_ftr_2_rtr]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_file_trigger_router]  WITH CHECK ADD  CONSTRAINT [sym_fk_ftr_2_rtr] FOREIGN KEY([router_id])
REFERENCES [dbo].[sym_router] ([router_id])
GO
ALTER TABLE [dbo].[sym_file_trigger_router] CHECK CONSTRAINT [sym_fk_ftr_2_rtr]
GO
/****** Object:  ForeignKey [sym_fk_gpltlnk_2_gplt]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_grouplet_link]  WITH CHECK ADD  CONSTRAINT [sym_fk_gpltlnk_2_gplt] FOREIGN KEY([grouplet_id])
REFERENCES [dbo].[sym_grouplet] ([grouplet_id])
GO
ALTER TABLE [dbo].[sym_grouplet_link] CHECK CONSTRAINT [sym_fk_gpltlnk_2_gplt]
GO
/****** Object:  ForeignKey [sym_fk_lnk_2_grp_src]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_group_link]  WITH CHECK ADD  CONSTRAINT [sym_fk_lnk_2_grp_src] FOREIGN KEY([source_node_group_id])
REFERENCES [dbo].[sym_node_group] ([node_group_id])
GO
ALTER TABLE [dbo].[sym_node_group_link] CHECK CONSTRAINT [sym_fk_lnk_2_grp_src]
GO
/****** Object:  ForeignKey [sym_fk_lnk_2_grp_tgt]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_group_link]  WITH CHECK ADD  CONSTRAINT [sym_fk_lnk_2_grp_tgt] FOREIGN KEY([target_node_group_id])
REFERENCES [dbo].[sym_node_group] ([node_group_id])
GO
ALTER TABLE [dbo].[sym_node_group_link] CHECK CONSTRAINT [sym_fk_lnk_2_grp_tgt]
GO
/****** Object:  ForeignKey [sym_fk_ident_2_node]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_identity]  WITH CHECK ADD  CONSTRAINT [sym_fk_ident_2_node] FOREIGN KEY([node_id])
REFERENCES [dbo].[sym_node] ([node_id])
GO
ALTER TABLE [dbo].[sym_node_identity] CHECK CONSTRAINT [sym_fk_ident_2_node]
GO
/****** Object:  ForeignKey [sym_fk_sec_2_node]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_node_security]  WITH CHECK ADD  CONSTRAINT [sym_fk_sec_2_node] FOREIGN KEY([node_id])
REFERENCES [dbo].[sym_node] ([node_id])
GO
ALTER TABLE [dbo].[sym_node_security] CHECK CONSTRAINT [sym_fk_sec_2_node]
GO
/****** Object:  ForeignKey [sym_fk_rt_2_grp_lnk]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_router]  WITH CHECK ADD  CONSTRAINT [sym_fk_rt_2_grp_lnk] FOREIGN KEY([source_node_group_id], [target_node_group_id])
REFERENCES [dbo].[sym_node_group_link] ([source_node_group_id], [target_node_group_id])
GO
ALTER TABLE [dbo].[sym_router] CHECK CONSTRAINT [sym_fk_rt_2_grp_lnk]
GO
/****** Object:  ForeignKey [sym_fk_tt_2_grp_lnk]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_transform_table]  WITH CHECK ADD  CONSTRAINT [sym_fk_tt_2_grp_lnk] FOREIGN KEY([source_node_group_id], [target_node_group_id])
REFERENCES [dbo].[sym_node_group_link] ([source_node_group_id], [target_node_group_id])
GO
ALTER TABLE [dbo].[sym_transform_table] CHECK CONSTRAINT [sym_fk_tt_2_grp_lnk]
GO
/****** Object:  ForeignKey [sym_fk_trg_2_chnl]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_trigger]  WITH CHECK ADD  CONSTRAINT [sym_fk_trg_2_chnl] FOREIGN KEY([channel_id])
REFERENCES [dbo].[sym_channel] ([channel_id])
GO
ALTER TABLE [dbo].[sym_trigger] CHECK CONSTRAINT [sym_fk_trg_2_chnl]
GO
/****** Object:  ForeignKey [sym_fk_trg_2_rld_chnl]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_trigger]  WITH CHECK ADD  CONSTRAINT [sym_fk_trg_2_rld_chnl] FOREIGN KEY([reload_channel_id])
REFERENCES [dbo].[sym_channel] ([channel_id])
GO
ALTER TABLE [dbo].[sym_trigger] CHECK CONSTRAINT [sym_fk_trg_2_rld_chnl]
GO
/****** Object:  ForeignKey [sym_fk_tr_2_rtr]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_trigger_router]  WITH CHECK ADD  CONSTRAINT [sym_fk_tr_2_rtr] FOREIGN KEY([router_id])
REFERENCES [dbo].[sym_router] ([router_id])
GO
ALTER TABLE [dbo].[sym_trigger_router] CHECK CONSTRAINT [sym_fk_tr_2_rtr]
GO
/****** Object:  ForeignKey [sym_fk_tr_2_trg]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_trigger_router]  WITH CHECK ADD  CONSTRAINT [sym_fk_tr_2_trg] FOREIGN KEY([trigger_id])
REFERENCES [dbo].[sym_trigger] ([trigger_id])
GO
ALTER TABLE [dbo].[sym_trigger_router] CHECK CONSTRAINT [sym_fk_tr_2_trg]
GO
/****** Object:  ForeignKey [sym_fk_trgplt_2_gplt]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_trigger_router_grouplet]  WITH CHECK ADD  CONSTRAINT [sym_fk_trgplt_2_gplt] FOREIGN KEY([grouplet_id])
REFERENCES [dbo].[sym_grouplet] ([grouplet_id])
GO
ALTER TABLE [dbo].[sym_trigger_router_grouplet] CHECK CONSTRAINT [sym_fk_trgplt_2_gplt]
GO
/****** Object:  ForeignKey [sym_fk_trgplt_2_tr]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[sym_trigger_router_grouplet]  WITH CHECK ADD  CONSTRAINT [sym_fk_trgplt_2_tr] FOREIGN KEY([trigger_id], [router_id])
REFERENCES [dbo].[sym_trigger_router] ([trigger_id], [router_id])
GO
ALTER TABLE [dbo].[sym_trigger_router_grouplet] CHECK CONSTRAINT [sym_fk_trgplt_2_tr]
GO
/****** Object:  ForeignKey [FK_tb_course]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[tb_course]  WITH CHECK ADD  CONSTRAINT [FK_tb_course] FOREIGN KEY([tid])
REFERENCES [dbo].[tb_teacher] ([id])
GO
ALTER TABLE [dbo].[tb_course] CHECK CONSTRAINT [FK_tb_course]
GO
/****** Object:  ForeignKey [FK_tb_faculty]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[tb_faculty]  WITH CHECK ADD  CONSTRAINT [FK_tb_faculty] FOREIGN KEY([bid])
REFERENCES [dbo].[tb_branch] ([id])
GO
ALTER TABLE [dbo].[tb_faculty] CHECK CONSTRAINT [FK_tb_faculty]
GO
/****** Object:  ForeignKey [FK_tb_sc]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[tb_sc]  WITH CHECK ADD  CONSTRAINT [FK_tb_sc] FOREIGN KEY([cid])
REFERENCES [dbo].[tb_course] ([id])
GO
ALTER TABLE [dbo].[tb_sc] CHECK CONSTRAINT [FK_tb_sc]
GO
/****** Object:  ForeignKey [FK_tb_sc1]    Script Date: 06/13/2019 21:20:25 ******/
ALTER TABLE [dbo].[tb_sc]  WITH CHECK ADD  CONSTRAINT [FK_tb_sc1] FOREIGN KEY([sid])
REFERENCES [dbo].[tb_student] ([id])
GO
ALTER TABLE [dbo].[tb_sc] CHECK CONSTRAINT [FK_tb_sc1]
GO
