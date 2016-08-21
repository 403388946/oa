CREATE TABLE oa_agreement
(
    id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    price_num VARCHAR(255),
    salary DOUBLE(20,2) NOT NULL,
    create_time DATETIME NOT NULL,
    creater BIGINT NOT NULL,
    update_time DATETIME,
    updater BIGINT,
    is_del INT DEFAULT 0 NOT NULL,
    custom_id BIGINT
);
CREATE TABLE oa_custom
(
    id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    code VARCHAR(255) NOT NULL,
    create_time DATETIME NOT NULL,
    creater BIGINT NOT NULL,
    update_time DATETIME,
    updater BIGINT,
    is_del INT DEFAULT 0 NOT NULL
);
CREATE TABLE oa_employee
(
    id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    code VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    id_card VARCHAR(255) NOT NULL,
    custom_code VARCHAR(255) NOT NULL,
    custom_price_num VARCHAR(255) DEFAULT '0.00' NOT NULL,
    order_code VARCHAR(255),
    custom_name VARCHAR(255),
    join_date DATETIME NOT NULL,
    pay_code VARCHAR(255) NOT NULL,
    service_status INT,
    employment_form INT,
    create_time DATETIME NOT NULL,
    creater BIGINT NOT NULL,
    update_time DATETIME,
    updater BIGINT,
    is_del INT DEFAULT 0 NOT NULL,
    agreement_id BIGINT
);
CREATE TABLE oa_file_info
(
    id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    path VARCHAR(200),
    local_name VARCHAR(50),
    real_name VARCHAR(50),
    file_size BIGINT,
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    service_id BIGINT NOT NULL,
    service_type INT NOT NULL,
    file_type VARCHAR(20),
    file_id VARCHAR(36) NOT NULL
);
CREATE TABLE sys_organization
(
    id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    parent_id BIGINT,
    parent_ids VARCHAR(100),
    available TINYINT DEFAULT 0
);
CREATE TABLE sys_resource
(
    id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    type VARCHAR(50),
    url VARCHAR(200),
    parent_id BIGINT,
    parent_ids VARCHAR(100),
    permission VARCHAR(100),
    available TINYINT DEFAULT 0
);
CREATE TABLE sys_role
(
    id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    role VARCHAR(100),
    description VARCHAR(100),
    resource_ids VARCHAR(100),
    available TINYINT DEFAULT 0
);
CREATE TABLE sys_user
(
    id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    organization_id BIGINT,
    username VARCHAR(100),
    password VARCHAR(100),
    salt VARCHAR(100),
    role_ids VARCHAR(100),
    locked TINYINT DEFAULT 0
);
CREATE INDEX idx_sys_organization_parent_id ON sys_organization (parent_id);
CREATE INDEX idx_sys_organization_parent_ids ON sys_organization (parent_ids);
CREATE INDEX idx_sys_resource_parent_id ON sys_resource (parent_id);
CREATE INDEX idx_sys_resource_parent_ids ON sys_resource (parent_ids);
CREATE INDEX idx_sys_role_resource_ids ON sys_role (resource_ids);
CREATE UNIQUE INDEX idx_sys_user_username ON sys_user (username);
CREATE INDEX idx_sys_user_organization_id ON sys_user (organization_id);
