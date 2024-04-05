import Api from "./Api";

export default {
  getCompany(companyId) {
    return Api().get(`/api/company/getCompany/${companyId}`);
  },
  createCompany(credentials) {
    return Api().post("/api/company/createCompany", credentials);
  },
  createContract(credentials) {
    return Api().post("/api/company/createContract", credentials);
  },
  getCompanyByName(companyName){
    return Api().get(`/api/company/getCompanyByName/${companyName}`)
  },
  getAllCompanies(){
    return Api().get("/api/company/getAllCompany")
  }
};
