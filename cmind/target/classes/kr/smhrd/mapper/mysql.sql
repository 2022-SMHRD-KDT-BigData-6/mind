SELECT * FROM testdata
SELECT * FROM test_log

DELETE FROM testdata
DELETE FROM test_log


SHOW TABLES
drop table test_log

create table test_log(
    testidx int auto_increment not null,
    userid varchar(20) not null,
    resultdate datetime default now(),
    AggAnx int not null,
    SocialAnx int not null,
    SadAnx int not null,
    ComplexAnx int not null,
    RegAnx int not null,
    diagnosis_result text(60000) not null,
    primary key(testidx)
);

alter table test_log add foreign key(userid) references memberinfo(userid) on delete cascade;