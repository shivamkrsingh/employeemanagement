using EmployeeService as service from '../srv/service';

/*--------------------------------------------------------------*/
/* Company Field Annotations                                    */
/*--------------------------------------------------------------*/

annotate service.Companies with {

    industry @(
        Common.Text : industry.name,
        Common.TextArrangement : #TextOnly,

        Common.ValueList : {
            Label : 'Industry',
            CollectionPath : 'Industries',

            Parameters : [

                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : industry,
                    ValueListProperty : 'ID'
                },

                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'code'
                },

                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                }

            ]
        }
    );

};

/*--------------------------------------------------------------*/
/* Company Entity Annotations                                   */
/*--------------------------------------------------------------*/

annotate service.Companies with @(

    UI.HeaderInfo : {

        TypeName : 'Company',
        TypeNamePlural : 'Companies',

        Title : {
            $Type : 'UI.DataField',
            Value : name
        },

        Description : {
            $Type : 'UI.DataField',
            Value : country
        }

    },

    UI.SelectionFields : [

        name,
        country,
        industry_ID

    ],

    UI.LineItem : [

        {
            $Type : 'UI.DataField',
            Label : 'Company',
            Value : name
        },

        {
            $Type : 'UI.DataField',
            Label : 'Country',
            Value : country
        },

        {
            $Type : 'UI.DataField',
            Label : 'Industry',
            Value : industry.name
        },

        {
            $Type : 'UI.DataField',
            Label : 'Revenue',
            Value : revenue
        }

    ],

    UI.FieldGroup #General : {

        Data : [

            { $Type : 'UI.DataField', Value : name },
            { $Type : 'UI.DataField', Value : code },
            { $Type : 'UI.DataField', Value : country },
            { $Type : 'UI.DataField', Value : industry.name },
            { $Type : 'UI.DataField', Value : revenue },
            { $Type : 'UI.DataField', Value : establishedOn }

        ]

    },

    UI.Facets : [

        {
            $Type : 'UI.ReferenceFacet',
            Label : 'General Information',
            Target : '@UI.FieldGroup#General'
        },

        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Departments',
            Target : 'departments/@UI.LineItem'
        }

    ]

);

/*--------------------------------------------------------------*/
/* Department Entity Annotations                                 */
/*--------------------------------------------------------------*/

annotate service.Departments with @(

    UI.HeaderInfo : {
        TypeName       : 'Department',
        TypeNamePlural : 'Departments',

        Title : {
            $Type : 'UI.DataField',
            Value : name
        },

        Description : {
            $Type : 'UI.DataField',
            Value : code
        }
    },

    UI.LineItem : [

        { $Type : 'UI.DataField', Value : name },
        { $Type : 'UI.DataField', Value : code },
        { $Type : 'UI.DataField', Value : costCenter },
        { $Type : 'UI.DataField', Value : budget }

    ],

    UI.FieldGroup #General : {

        Data : [

            { $Type : 'UI.DataField', Value : name },
            { $Type : 'UI.DataField', Value : code },
            { $Type : 'UI.DataField', Value : costCenter },
            { $Type : 'UI.DataField', Value : budget }

        ]

    },

    UI.Facets : [

        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'General Information',
            Target : '@UI.FieldGroup#General'
        },

        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Employees',
            Target : 'employees/@UI.LineItem'
        }

    ]

);

/*--------------------------------------------------------------*/
/* Employee Field Annotations                                    */
/*--------------------------------------------------------------*/

annotate service.Employees with {

    department @(
        Common.Text : department.name,
        Common.TextArrangement : #TextOnly,

        Common.ValueList : {
            Label : 'Department',
            CollectionPath : 'Departments',

            Parameters : [

                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : department,
                    ValueListProperty : 'ID'
                },

                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'code'
                },

                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                }

            ]
        }
    );

    industry @(
        Common.Text : industry.name,
        Common.TextArrangement : #TextOnly,

        Common.ValueList : {
            Label : 'Industry',
            CollectionPath : 'Industries',

            Parameters : [

                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : industry,
                    ValueListProperty : 'ID'
                },

                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'code'
                },

                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                }

            ]
        }
    );

};

/*--------------------------------------------------------------*/
/* Employee Entity Annotations                                   */
/*--------------------------------------------------------------*/

annotate service.Employees with @(

    UI.HeaderInfo : {

        TypeName : 'Employee',
        TypeNamePlural : 'Employees',

        Title : {
            $Type : 'UI.DataField',
            Value : firstName
        },

        Description : {
            $Type : 'UI.DataField',
            Value : designation
        }

    },

    UI.SelectionFields : [

        firstName,
        lastName,
        status,
        department_ID,
        industry

    ],

    UI.LineItem : [

        {
            $Type : 'UI.DataField',
            Label : 'Employee No',
            Value : employeeNo
        },

        {
            $Type : 'UI.DataField',
            Label : 'First Name',
            Value : firstName
        },

        {
            $Type : 'UI.DataField',
            Label : 'Last Name',
            Value : lastName
        },

        {
            $Type : 'UI.DataField',
            Label : 'Department',
            Value : department.name
        },

        {
            $Type : 'UI.DataField',
            Label : 'Industry',
            Value : industry.name
        },

        {
            $Type : 'UI.DataField',
            Label : 'Designation',
            Value : designation
        },

        {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : status
        }

    ],

    UI.Identification : [

        { $Type : 'UI.DataField', Value : firstName },
        { $Type : 'UI.DataField', Value : lastName },
        { $Type : 'UI.DataField', Value : email }

    ],

    UI.FieldGroup #General : {

        Data : [

            { $Type : 'UI.DataField', Value : employeeNo },
            { $Type : 'UI.DataField', Value : firstName },
            { $Type : 'UI.DataField', Value : lastName },
            { $Type : 'UI.DataField', Value : email },
            { $Type : 'UI.DataField', Value : phone },
            { $Type : 'UI.DataField', Value : status }

        ]

    },

    UI.FieldGroup #Employment : {

        Data : [

            { $Type : 'UI.DataField', Value : department.name },
            { $Type : 'UI.DataField', Value : industry.name },
            { $Type : 'UI.DataField', Value : designation },
            { $Type : 'UI.DataField', Value : joiningDate },
            { $Type : 'UI.DataField', Value : salary }

        ]

    },

    UI.Facets : [

        {
            $Type : 'UI.ReferenceFacet',
            Label : 'General Information',
            Target : '@UI.FieldGroup#General'
        },

        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Employment Details',
            Target : '@UI.FieldGroup#Employment'
        },

        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Skills',
            Target : 'skills/@UI.LineItem'
        },

        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Certifications',
            Target : 'certifications/@UI.LineItem'
        },

        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Documents',
            Target : 'documents/@UI.LineItem'
        }

    ]

);

/*--------------------------------------------------------------*/
/* Skill Entity Annotations (sub-table + own drill-down page)    */
/*--------------------------------------------------------------*/

annotate service.Skills with @(

    UI.HeaderInfo : {
        TypeName       : 'Skill',
        TypeNamePlural : 'Skills',
        Title : { $Type : 'UI.DataField', Value : name },
        Description : { $Type : 'UI.DataField', Value : level }
    },

    UI.LineItem : [
        { $Type : 'UI.DataField', Label : 'Skill', Value : name },
        { $Type : 'UI.DataField', Label : 'Level', Value : level }
    ],

    UI.FieldGroup #General : {
        Data : [
            { $Type : 'UI.DataField', Value : name },
            { $Type : 'UI.DataField', Value : level }
        ]
    },

    UI.Facets : [
        { $Type : 'UI.ReferenceFacet', Label : 'Details', Target : '@UI.FieldGroup#General' }
    ]

);

/*--------------------------------------------------------------*/
/* Certification / Document Entity Annotations (sub-tables only) */
/*--------------------------------------------------------------*/

annotate service.Certifications with @(
    UI.LineItem : [
        { $Type : 'UI.DataField', Label : 'Certification', Value : title },
        { $Type : 'UI.DataField', Label : 'Provider', Value : provider },
        { $Type : 'UI.DataField', Label : 'Issued', Value : issueDate },
        { $Type : 'UI.DataField', Label : 'Expires', Value : expiryDate }
    ]
);

annotate service.Documents with @(
    UI.LineItem : [
        { $Type : 'UI.DataField', Label : 'File Name', Value : fileName },
        { $Type : 'UI.DataField', Label : 'Type', Value : mediaType },
        { $Type : 'UI.DataField', Label : 'Size', Value : fileSize }
    ]
);
