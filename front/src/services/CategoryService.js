import Api from "./Api";

export default {
  getCategoryList() {
    return Api().get("/api/category/getCategoryList");
  },
  getCategoryById(id) {
    return Api().get(`/api/category/getCategoryById/${id}`);
  },
  getCategoryByName(name) {
    return Api().get(`/api/category/getCategoryByName/${name}`);
  },
  createCategory(credentials) {
    return Api().post("/api/category/createCategory", credentials);
  },
  updateCategory(credentials) {
    return Api().put("/api/category/updateCategory", credentials);
  },
  deleteCategory(categoryId) {
    return Api().delete(`/api/category/deleteCategory/${categoryId}`);
  },
};
