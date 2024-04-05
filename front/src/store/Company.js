import CompanyService from "@/services/CompanyService.js";
export const CompanyModule = {
  namespaced: true,
  strict: true,
  state: {
    companyId: 1,
    company: {},
    companies:[],
  },
  mutations: {
    SET_COMPANY(state, company) {
      state.company = company;
    },
  },

   SET_NAME(state, { Name}) {
    state.company.name = Name;
  },
  SET_NEW_COMPANY_EMAIL(state, email) {
    state.companyEmail = email;
  },
  SET_COMPANIES(state, companies) {
    state.companies = companies;
  },
  actions: {

    async setCompanies({ commit }) {
      try {
        const Companies = (await CompanyService.getAllCompany()).data;
        commit("SET_COMPANIES", Companies);
      } catch (error) {
        console.log(error.response.data.error);
      }
    },

    async getCompanies({ state, dispatch }) {
      if (state.Companies && state.Companies.length == 0) {
        await dispatch("setCompanies");
      }
      return state.Companies;
    },


    async setNewCompany({ state, commit }) {
      try {
        const company = (await CompanyService.createCompany(state.commit)).data;
        commit("SET_COMPANY", company);
      } catch (error) {
        console.log(error.response.data.error);
      }
    },

    async setCompany({ state, commit }) {
      try {
        const company = (await CompanyService.getCompany(state.companyId)).data;
        commit("SET_COMPANY", company);
      } catch (error) {
        console.log(error.response.data.error);
      }
    },
    async getCompany({ state, dispatch }) {
      if (Object.keys(state.company).length == 0) {
        await dispatch("setCompany");
      }
      return state.company;
    },
    async setName({ commit }, { Name }) {
      commit("SET_NAME", { Name});
    },
    
    async setNewCompanyEmail({ commit }, email) {
      commit("SET_NEW_COMPANY_EMAIL", email);
    },
    
    async getCompanyLogo({ state, dispatch }) {
      if (!state.company.logo) {
        await dispatch("setCompany");
      }
      return state.company.logo;
    },
    async getCompanyName({ state, dispatch }) {
      if (!state.company.name) {
        await dispatch("setCompany");
      }
      return state.company.name;
    },
  },
};
