CREATE TABLE `ps_aors` (
  `id` varchar (40) NOT NULL,
  `contact` varchar (255) DEFAULT NULL,
  `default_expiration` int (11) DEFAULT NULL,
  `mailboxes` varchar (80) DEFAULT NULL,
  `max_contacts` int (11) DEFAULT NULL,
  `minimum_expiration` int (11) DEFAULT NULL,
  `remove_existing` enum ('yes', 'no') DEFAULT NULL,
  `qualify_frequency` int (11) DEFAULT NULL,
  `authenticate_qualify` enum ('yes', 'no') DEFAULT NULL,
  `maximum_expiration` int (11) DEFAULT NULL,
  `outbound_proxy` varchar (40) DEFAULT NULL,
  `support_path` enum ('yes', 'no') DEFAULT NULL,
  `qualify_timeout` float DEFAULT NULL,
  `voicemail_extension` varchar (40) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_aors_id` (`id`),
  KEY `ps_aors_qualifyfreq_contact` (`qualify_frequency`, `contact`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE `ps_auths` (
  `id` varchar (40) NOT NULL,
  `auth_type` enum ('md5', 'userpass') DEFAULT NULL,
  `nonce_lifetime` int (11) DEFAULT NULL,
  `md5_cred` varchar (40) DEFAULT NULL,
  `password` varchar (80) DEFAULT NULL,
  `realm` varchar (40) DEFAULT NULL,
  `username` varchar (40) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_auths_id` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE `ps_contacts` (
  `id` varchar (255) DEFAULT NULL,
  `uri` varchar (255) DEFAULT NULL,
  `expiration_time` bigint (20) DEFAULT NULL,
  `qualify_frequency` int (11) DEFAULT NULL,
  `outbound_proxy` varchar (40) DEFAULT NULL,
  `path` varchar (200),
  `user_agent` varchar (255) DEFAULT NULL,
  `qualify_timeout` float DEFAULT NULL,
  `reg_server` varchar (20) DEFAULT NULL,
  `authenticate_qualify` enum ('yes', 'no') DEFAULT NULL,
  `via_addr` varchar (40) DEFAULT NULL,
  `via_port` int (11) DEFAULT NULL,
  `call_id` varchar (255) DEFAULT NULL,
  `endpoint` varchar (40) DEFAULT NULL,
  `prune_on_boot` enum ('yes', 'no') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `ps_contacts_uq` (`id`, `reg_server`),
  KEY `ps_contacts_id` (`id`),
  KEY `ps_contacts_qualifyfreq_exp` (`qualify_frequency`, `expiration_time`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE `ps_domain_aliases` (
  `id` varchar (40) NOT NULL,
  `domain` varchar (80) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_domain_aliases_id` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;


CREATE TABLE `ps_endpoint_id_ips` (
  `id` varchar (40) NOT NULL,
  `endpoint` varchar (40) DEFAULT NULL,
  `match` varchar (80) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_endpoint_id_ips_id` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;


CREATE TABLE `ps_endpoints` (
  `id` varchar (40) NOT NULL,
  `transport` varchar (40) DEFAULT NULL,
  `aors` varchar (200) DEFAULT NULL,
  `auth` varchar (40) DEFAULT NULL,
  `context` varchar (40) DEFAULT NULL,
  `disallow` varchar (200) DEFAULT NULL,
  `allow` varchar (200) DEFAULT NULL,
  `direct_media` enum ('yes', 'no') DEFAULT NULL,
  `connected_line_method` enum ('invite', 'reinvite', 'update') DEFAULT NULL,
  `direct_media_method` enum ('invite', 'reinvite', 'update') DEFAULT NULL,
  `direct_media_glare_mitigation` enum ('none', 'outgoing', 'incoming') DEFAULT NULL,
  `disable_direct_media_on_nat` enum ('yes', 'no') DEFAULT NULL,
  `dtmf_mode` enum ('rfc4733', 'inband', 'info', 'auto') DEFAULT NULL,
  `external_media_address` varchar (40) DEFAULT NULL,
  `force_rport` enum ('yes', 'no') DEFAULT NULL,
  `ice_support` enum ('yes', 'no') DEFAULT NULL,
  `identify_by` enum ('username', 'auth_username') DEFAULT NULL,
  `mailboxes` varchar (40) DEFAULT NULL,
  `moh_suggest` varchar (40) DEFAULT NULL,
  `outbound_auth` varchar (40) DEFAULT NULL,
  `outbound_proxy` varchar (40) DEFAULT NULL,
  `rewrite_contact` enum ('yes', 'no') DEFAULT NULL,
  `rtp_ipv6` enum ('yes', 'no') DEFAULT NULL,
  `rtp_symmetric` enum ('yes', 'no') DEFAULT NULL,
  `send_diversion` enum ('yes', 'no') DEFAULT NULL,
  `send_pai` enum ('yes', 'no') DEFAULT NULL,
  `send_rpid` enum ('yes', 'no') DEFAULT NULL,
  `timers_min_se` int (11) DEFAULT NULL,
  `timers` enum ('forced', 'no', 'required', 'yes') DEFAULT NULL,
  `timers_sess_expires` int (11) DEFAULT NULL,
  `callerid` varchar (40) DEFAULT NULL,
  -- `callerid_privacy` enum ('allowed_not_screened', 'allowed_passed_screened', 'allowed_failed_screened', 'allowed', 'prohib_not_screened', 'prohib_passed_screened', 'prohib_passed_screened', 'prohib_failed_screened', 'prohib', 'unavailable', DEFAULT NUU unparsed_screened,'prohib_filed_screened','prohib','unavailable')
  `callerid_privacy` enum ('allowed_not_screened', 'allowed_passed_screened', 'allowed_failed_screened', 'allowed', 'prohib_not_screened', 'prohib_passed_screened', 'prohib_failed_screened', 'prohib', 'unavailable', 'unparsed_screened','prohib_filed_screened'),
  `callerid_tag` varchar (40) DEFAULT NULL,
  `100re` enum ('no', 'required', 'yes') DEFAULT NULL,
  `aggregate_mwi` enum ('yes', 'no') DEFAULT NULL,
  `trust_id_inbound` enum ('yes', 'no') DEFAULT NULL,
  `trust_id_outbound` enum ('yes', 'no') DEFAULT NULL,
  `use_ptime` enum ('yes', 'no') DEFAULT NULL,
  `use_avpf` enum ('yes', 'no') DEFAULT NULL,
  `media_encryption` enum ('no', 'sdes', 'dtls') DEFAULT NULL,
  `inband_progress` enum ('yes', 'no') DEFAULT NULL,
  `call_group` varchar (40) DEFAULT NULL,
  `pickup_group` varchar (40) DEFAULT NULL,
  `named_call_group` varchar (40) DEFAULT NULL,
  `named_pickup_group` varchar (40) DEFAULT NULL,
  `device_state_busy_at` int (11) DEFAULT NULL,
  `fax_detect` enum ('yes', 'no') DEFAULT NULL,
  `t38_udptl` enum ('yes', 'no') DEFAULT NULL,
  `t38_udptl_ec` enum ('none', 'fec', 'redundancy') DEFAULT NULL,
  `t38_udptl_maxdatagram` int (11) DEFAULT NULL,
  `t38_udptl_nat` enum ('yes', 'no') DEFAULT NULL,
  `t38_udptl_ipv6` enum ('yes', 'no') DEFAULT NULL,
  `tone_zone` varchar (40) DEFAULT NULL,
  `language` varchar (40) DEFAULT NULL,
  `one_touch_recording` enum ('yes', 'no') DEFAULT NULL,
  `record_on_feature` varchar (40) DEFAULT NULL,
  `record_off_feature` varchar (40) DEFAULT NULL,
  `rtp_engine` varchar (40) DEFAULT NULL,
  `allow_transfer` enum ('yes', 'no') DEFAULT NULL,
  `allow_subscribe` enum ('yes', 'no') DEFAULT NULL,
  `sdp_owner` varchar (40) DEFAULT NULL,
  `sdp_session` varchar (40) DEFAULT NULL,
  `tos_audio` varchar (10) DEFAULT NULL,
  `tos_video` varchar (10) DEFAULT NULL,
  `sub_min_expiry` int (11) DEFAULT NULL,
  `from_domain` varchar (40) DEFAULT NULL,
  `from_user` varchar (40) DEFAULT NULL,
  `mwi_from_user` varchar (40) DEFAULT NULL,
  `dtls_verify` varchar (40) DEFAULT NULL,
  `dtls_rekey` varchar (40) DEFAULT NULL,
  `dtls_cert_file` varchar (200) DEFAULT NULL,
  `dtls_private_key` varchar (200) DEFAULT NULL,
  `dtls_cipher` varchar (200) DEFAULT NULL,
  `dtls_ca_file` varchar (200) DEFAULT NULL,
  `dtls_ca_path` varchar (200) DEFAULT NULL,
  `dtls_setup` enum ('active', 'passive', 'actpass') DEFAULT NULL,
  `srtp_tag_32` enum ('yes', 'no') DEFAULT NULL,
  `media_address` varchar (40) DEFAULT NULL,
  `redirect_method` enum ('user', 'uri_core', 'uri_pjsip') DEFAULT NULL,
  `set_var` varchar (200),
  `cos_audio` int (11) DEFAULT NULL,
  `cos_video` int (11) DEFAULT NULL,
  `message_context` varchar (40) DEFAULT NULL,
  `force_avp` enum ('yes', 'no') DEFAULT NULL,
  `media_use_received_transport` enum ('yes', 'no') DEFAULT NULL,
  `accountcode` varchar (80) DEFAULT NULL,
  `user_eq_phone` enum ('yes', 'no') DEFAULT NULL,
  `moh_passthrough` enum ('yes', 'no') DEFAULT NULL,
  `media_encryption_optimistic` enum ('yes', 'no') DEFAULT NULL,
  `rpid_immediate` enum ('yes', 'no') DEFAULT NULL,
  `g726_non_standard` enum ('yes', 'no') DEFAULT NULL,
  `rtp_keepalive` int (11) DEFAULT NULL,
  `rtp_timeout` int (11) DEFAULT NULL,
  `rtp_timeout_hold` int (11) DEFAULT NULL,
  `bind_rtp_to_media_address` enum ('yes', 'no') DEFAULT NULL,
  `voicemail_extension` varchar (40) DEFAULT NULL,
  `mwi_subscribe_replaces_unsolicited` int (11) DEFAULT NULL,
  `deny` varchar (95) DEFAULT NULL,
  `permit` varchar (95) DEFAULT NULL,
  `acl` varchar (40) DEFAULT NULL,
  `contact_deny` varchar (95) DEFAULT NULL,
  `contact_permit` varchar (95) DEFAULT NULL,
  `contact_acl` varchar (40) DEFAULT NULL,
  `subscribe_context` varchar (40) DEFAULT NULL,
  `fax_detect_timeout` int (11) DEFAULT NULL,
  `contact_user` varchar (80) DEFAULT NULL,
  `asymmetric_rtp_codec` enum ('yes', 'no') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_endpoints_id` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;



CREATE TABLE `ps_globals` (
  `id` varchar (40) NOT NULL,
  `max_forwards` int (11) DEFAULT NULL,
  `user_agent` varchar (255) DEFAULT NULL,
  `default_outbound_endpoint` varchar (40) DEFAULT NULL,
  `debug` varchar (40) DEFAULT NULL,
  `endpoint_identifier_order` varchar (40) DEFAULT NULL,
  `max_initial_qualify_time` int (11) DEFAULT NULL,
  `default_from_user` varchar (80) DEFAULT NULL,
  `keep_alive_interval` int (11) DEFAULT NULL,
  `regcontext` varchar (80) DEFAULT NULL,
  `contact_expiration_check_interval` int (11) DEFAULT NULL,
  `default_voicemail_extension` varchar (40) DEFAULT NULL,
  `disable_multi_domain` enum ('yes', 'no') DEFAULT NULL,
  `unidentified_request_count` int (11) DEFAULT NULL,
  `unidentified_request_period` int (11) DEFAULT NULL,
  `unidentified_request_prune_interval` int (11) DEFAULT NULL,
  `default_realm` varchar (40) DEFAULT NULL,
  `mwi_tps_queue_high` int (11) DEFAULT NULL,
  `mwi_tps_queue_low` int (11) DEFAULT NULL,
  `mwi_disable_initial_unsolicited` enum ('yes', 'no') DEFAULT NULL,
  `ignore_uri_user_options` enum ('yes', 'no') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_globals_id` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;


CREATE TABLE `ps_registrations` (
  `id` varchar (40) NOT NULL,
  `auth_rejection_permanent` enum ('yes', 'no') DEFAULT NULL,
  `client_uri` varchar (255) DEFAULT NULL,
  `contact_user` varchar (40) DEFAULT NULL,
  `expiration` int (11) DEFAULT NULL,
  `max_retries` int (11) DEFAULT NULL,
  `outbound_auth` varchar (40) DEFAULT NULL,
  `outbound_proxy` varchar (40) DEFAULT NULL,
  `retry_interval` int (11) DEFAULT NULL,
  `forbidden_retry_interval` int (11) DEFAULT NULL,
  `server_uri` varchar (255) DEFAULT NULL,
  `transport` varchar (40) DEFAULT NULL,
  `support_path` enum ('yes', 'no') DEFAULT NULL,
  `fatal_retry_interval` int (11) DEFAULT NULL,
  `line` enum ('yes', 'no') DEFAULT NULL,
  `endpoint` varchar (40) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_registrations_id` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;



CREATE TABLE `ps_subscription_persistence` (
  `id` varchar (40) NOT NULL,
  `packet` varchar (2048) DEFAULT NULL,
  `src_name` varchar (128) DEFAULT NULL,
  `src_port` int (11) DEFAULT NULL,
  `transport_key` varchar (64) DEFAULT NULL,
  `local_name` varchar (128) DEFAULT NULL,
  `local_port` int (11) DEFAULT NULL,
  `cseq` int (11) DEFAULT NULL,
  `tag` varchar (128) DEFAULT NULL,
  `endpoint` varchar (40) DEFAULT NULL,
  `expires` int (11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_subscription_persistence_id` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;


CREATE TABLE `ps_systems` (
  `id` varchar (40) NOT NULL,
  `timer_t1` int (11) DEFAULT NULL,
  `timer_b` int (11) DEFAULT NULL,
  `compact_headers` enum ('yes', 'no') DEFAULT NULL,
  `threadpool_initial_size` int (11) DEFAULT NULL,
  `threadpool_auto_increment` int (11) DEFAULT NULL,
  `threadpool_idle_timeout` int (11) DEFAULT NULL,
  `threadpool_max_size` int (11) DEFAULT NULL,
  `disable_tcp_switch` enum ('yes', 'no') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_systems_id` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;



CREATE TABLE `ps_transports` (
  `id` varchar (40) NOT NULL,
  `async_operations` int (11) DEFAULT NULL,
  `bind` varchar (40) DEFAULT NULL,
  `ca_list_file` varchar (200) DEFAULT NULL,
  `cert_file` varchar (200) DEFAULT NULL,
  `cipher` varchar (200) DEFAULT NULL,
  `domain` varchar (40) DEFAULT NULL,
  `external_media_address` varchar (40) DEFAULT NULL,
  `external_signaling_address` varchar (40) DEFAULT NULL,
  `external_signaling_port` int (11) DEFAULT NULL,
  `method` enum ('default', 'unspecified', 'tlsv1', 'sslv2', 'sslv3', 'sslv23') DEFAULT NULL,
  `local_net` varchar (40) DEFAULT NULL,
  `password` varchar (40) DEFAULT NULL,
  `priv_key_file` varchar (200) DEFAULT NULL,
  `protocol` enum ('udp', 'tcp', 'tls', 'ws', 'wss') DEFAULT NULL,
  `require_client_cert` enum ('yes', 'no') DEFAULT NULL,
  `verify_client` enum ('yes', 'no') DEFAULT NULL,
  `verify_server` enum ('yes', 'no') DEFAULT NULL,
  `tos` varchar (10) DEFAULT NULL,
  `cos` int (11) DEFAULT NULL,
  `allow_reload` enum ('yes', 'no') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_transports_id` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

