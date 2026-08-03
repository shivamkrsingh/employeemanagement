sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"app/spec/project1/test/integration/pages/CompaniesList.gen",
	"app/spec/project1/test/integration/pages/CompaniesObjectPage.gen",
	"app/spec/project1/test/integration/pages/DepartmentsObjectPage.gen"
], function (JourneyRunner, CompaniesListGenerated, CompaniesObjectPageGenerated, DepartmentsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('app/spec/project1') + '/test/flp.html#app-preview',
        pages: {
			onTheCompaniesListGenerated: CompaniesListGenerated,
			onTheCompaniesObjectPageGenerated: CompaniesObjectPageGenerated,
			onTheDepartmentsObjectPageGenerated: DepartmentsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

