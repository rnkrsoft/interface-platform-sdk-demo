
DROP TABLE IF EXISTS TB_INTERFACE_DEFINITION;

CREATE TABLE TB_INTERFACE_DEFINITION (
  serial_no varchar(255) NOT NULL COMMENT '物理主键 渠道号:交易码:版本号',
  tx_no varchar(255) NOT NULL COMMENT '交易码',
  version varchar(255) NOT NULL DEFAULT '1' COMMENT '版本号',
  channel varchar(255) NOT NULL DEFAULT 'public' COMMENT '渠道',
  interface_type varchar(255) NOT NULL DEFAULT 'SYNC' COMMENT '接口类型',
  interface_direction varchar(255) NOT NULL DEFAULT 'INNER' COMMENT '接口方向',
  gateway_url varchar(255) DEFAULT NULL COMMENT '网关地址',
  http_timeout_second int(11) DEFAULT '0' COMMENT 'HTTP外发通信时超时时间',
  service_class_name varchar(255) NOT NULL COMMENT '服务类名',
  method_name varchar(255) NOT NULL COMMENT '方法名',
  encrypt_algorithm varchar(255) NOT NULL DEFAULT 'AES' COMMENT '加密算法',
  decrypt_algorithm varchar(255) NOT NULL DEFAULT 'AES' COMMENT '解密算法',
  sign_algorithm varchar(255) NOT NULL DEFAULT 'SHA512' COMMENT '签字算法',
  verify_algorithm varchar(255) NOT NULL DEFAULT 'SHA512' COMMENT '验签算法',
  use_token_as_password tinyint(4) NOT NULL DEFAULT '1' COMMENT '使用TOKEN作为密码',
  password varchar(255) DEFAULT NULL COMMENT '密码',
  first_sign_second_encrypt tinyint(4) NOT NULL DEFAULT '1' COMMENT '首先签字然后加密',
  first_verify_second_decrypt tinyint(4) NOT NULL DEFAULT '1' COMMENT '首先校验然后解密',
  interface_desc text COMMENT '接口描述',
  validate_token tinyint(4) DEFAULT '1' COMMENT '是否校验TOKEN',
  idempotent_redo tinyint(4) DEFAULT '1' COMMENT '是否允许幂等进入重做，只适用于异步接口',
  write_message tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否记录通讯信息',
  write_mode varchar(255) DEFAULT 'SYNC' COMMENT '写入模式',
  key_vector varchar(255) DEFAULT '1234567890654321' COMMENT '秘钥向量',
  create_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  last_update_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (serial_no)
);



DROP TABLE IF EXISTS TB_INTERFACE_REQUEST;

CREATE TABLE TB_INTERFACE_REQUEST (
  request_no varchar(255) NOT NULL COMMENT '请求订单号',
  session_id varchar(36) DEFAULT NULL COMMENT '会话号，与日志保持一致',
  channel varchar(255) NOT NULL COMMENT '通道',
  tx_no varchar(36) NOT NULL COMMENT '交易码',
  version varchar(36) NOT NULL COMMENT '版本号',
  device_manufacturer varchar(255) DEFAULT NULL COMMENT '设备厂商 例如,xiaomi,apple',
  device_model varchar(255) DEFAULT NULL COMMENT '设备型号 例如 xiaomi note, iphone 6s',
  mac_address varchar(36) DEFAULT NULL COMMENT 'MAC地址 例如 44-45-53-54-00-00',
  device_type varchar(255) DEFAULT NULL COMMENT '设备类型 例如 iOS,Android,H5',
  os_version varchar(255) DEFAULT NULL COMMENT '操作系统版本 例如 11.4.1',
  app_version varchar(255) DEFAULT NULL COMMENT '应用版本 例如 3.1.2',
  uic varchar(255) DEFAULT NULL COMMENT '用户识别码,用于标记用户设备 例如 388c4292-b78f-4f53-9dee-f44b123f05ba',
  uid varchar(255) DEFAULT NULL COMMENT '用户号,用户在登录的情况下捕捉，可能为电话号码，1850000000',
  lng decimal(15,10) DEFAULT '0.0000000000' COMMENT '客户端调用的经度',
  lat decimal(15,10) DEFAULT '0.0000000000' COMMENT '客户端调用的纬度',
  client_ip varchar(255) DEFAULT NULL COMMENT '客户端IP地址',
  client_port int(11) DEFAULT NULL COMMENT '客户端端口号',
  inner_message longtext COMMENT '系统内侧信息',
  outer_message longtext COMMENT '系统外侧信息',
  order_status int(11) NOT NULL COMMENT '订单状态',
  response_no varchar(255) DEFAULT NULL COMMENT '处理该请求到终态的应答号订单信息',
  create_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  last_update_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP  COMMENT '更新日期',
  PRIMARY KEY (request_no)
) ;

DROP TABLE IF EXISTS TB_INTERFACE_RESPONSE;

CREATE TABLE TB_INTERFACE_RESPONSE (
  response_no varchar(255) NOT NULL COMMENT '应答号',
  rsp_type int(11) NOT NULL COMMENT '应答类型 1:同步应答  2:异步返回  3:异步应答  ',
  inner_message longtext COMMENT '系统内侧信息',
  outer_message longtext COMMENT '系统外侧信息',
  inner_rsp_code varchar(255) DEFAULT NULL COMMENT '系统内侧应答码',
  inner_rsp_desc varchar(255) DEFAULT NULL COMMENT '系统内侧应答描述',
  outer_rsp_code varchar(255) DEFAULT NULL COMMENT '系统外侧应答码',
  outer_rsp_desc varchar(255) DEFAULT NULL COMMENT '系统外侧应答描述',
  cause_stack_trace text COMMENT '导致异常堆栈',
  cause_message text COMMENT '导致异常的信息',
  request_no varchar(255) NOT NULL COMMENT '请求订单号，与请求记录保持一致',
  create_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  last_update_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP  COMMENT '更新日期',
  PRIMARY KEY (response_no)
) ;