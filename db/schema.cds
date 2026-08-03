namespace employee.management;

using {
    cuid,
    managed
} from '@sap/cds/common';

/*==============================================================*/
/* Company */
/*==============================================================*/

entity Companies : cuid, managed {

    name            : String(100);
    code            : String(10);

    country         : String(50);

    industry        : Association to Industries;

    revenue         : Decimal(15,2);

    establishedOn   : Date;

    departments     : Composition of many Departments
                        on departments.company = $self;
}


/*==============================================================*/
/* Department */
/*==============================================================*/

entity Departments : cuid, managed {

    name            : String(100);

    code            : String(20);

    costCenter      : String(20);

    budget          : Decimal(15,2);

    company         : Association to Companies;

    employees       : Composition of many Employees
                        on employees.department = $self;
}


/*==============================================================*/
/* Employee */
/*==============================================================*/

entity Employees : cuid, managed {

    employeeNo      : String(20);

    firstName       : String(50);

    lastName        : String(50);

    email           : String(100);

    phone           : String(30);

    designation     : String(100);

    salary          : Decimal(15,2);

    joiningDate     : Date;

    status          : String(20);

    department      : Association to Departments;

    skills          : Composition of many Skills
                        on skills.employee = $self;

    certifications  : Composition of many Certifications
                        on certifications.employee = $self;

    documents       : Composition of many Documents
                        on documents.employee = $self;
}


/*==============================================================*/
/* Skill */
/*==============================================================*/

entity Skills : cuid, managed {

    name            : String(100);

    level           : Integer;

    employee        : Association to Employees;
}


/*==============================================================*/
/* Certification */
/*==============================================================*/

entity Certifications : cuid, managed {

    title           : String(100);

    provider        : String(100);

    issueDate       : Date;

    expiryDate      : Date;

    employee        : Association to Employees;
}
entity Industries : cuid {

    code : String(10);
    name : String(100);

    companies : Association to many Companies
        on companies.industry = $self;
}

/*==============================================================*/
/* Document */
/*==============================================================*/

entity Documents : cuid, managed {

    fileName        : String(255);

    mediaType       : String(100);

    fileSize        : Integer;

    url             : String(500);

    employee        : Association to Employees;
}