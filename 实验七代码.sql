-- 1．	创建角色ProgramerRole，拥有创建表，存储过程，视图权限，拥有对Salary表的查询、修改、插入权限

-- 创建角色ProgramerRole
create role ProgramerRole

-- 授予查询、修改、插入权限
grant select,insert,alter
on Salary
to ProgramerRole

-- 授予创建表，存储过程，视图权限

-- 2．	创建一个登录账号Testlogin

create login Testlogin with password ='123456'
create user testuser from Testlogin

-- 3．	创建对应于这个登录账号的数据库用户TestUser
-- 4．	将用户TestUser添加到TestRole角色中
