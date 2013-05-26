CREATE TABLE `t_clientinfo` (
`clientid`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '终端Id' ,
`clientname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '终端名称' ,
`company`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属单位' ,
`region`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区' ,
`inserttime`  datetime NOT NULL COMMENT '入库时间' ,
`updatetime`  datetime NOT NULL COMMENT '更新时间' 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=COMPACT
;

CREATE TABLE `t_scoreinfo` (
`clientid`  varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '终端ID' ,
`msisdn`  varchar(11) NOT NULL ,
`score`  varchar(3) NOT NULL ,
`inserttime`  datetime NOT NULL 
)
;