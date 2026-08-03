using { employee.management as db } from '../db/schema';



service EmployeeService @(path: '/ZAPI_MANAGEMENT_SRV') {

    entity Companies        as projection on db.Companies;

    entity Industries       as projection on db.Industries;

    entity Departments      as projection on db.Departments;

    entity Employees        as projection on db.Employees {
        *,
        department.company.industry as industry
    };

    entity Skills           as projection on db.Skills;

    entity Certifications   as projection on db.Certifications;

    entity Documents        as projection on db.Documents;

}


extend EmployeeService.Employees with columns {
    seniorSkills : Association to many EmployeeService.Skills
        on seniorSkills.employee = $self
        and seniorSkills.name = 'SAP HANA Cloud'
}