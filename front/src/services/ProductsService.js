import Api from "./Api";

export default {
  getAllProducts() {
    return Api().get("/api/products/getAllProducts");
  },
  topSellProduct(limit) {
    return Api().get(`/api/products/topSellProduct/${limit}`);
  },
  newAddProduct(limit) {
    return Api().get(`/api/products/newAddProduct/${limit}`);
  },
  getRecommendation({ subSubCategoryId, limit }) {
    return Api().get(
      `/api/products/getRecommendation/${subSubCategoryId}/${limit}`
    );
  },
  getProductSales(productId) {
    return Api().get(`/api/products/getProductSales/${productId}`);
  },
  getProduct(productId) {
    return Api().get(`/api/products/getProduct/${productId}`);
  },
  getProductId(productTitle) {
    return Api().get(`/api/products/getProductId/${productTitle}`);
  },
  getProductById(productTitle) {
    return Api().get(`/api/products/getProductById/${productTitle}`);
  },
  getProductRating(productId) {
    return Api().get(`/api/products/getProductRating/${productId}`);
  },
  createProduct(credentials) {
    return Api().post("/api/products/createProduct", credentials);
  },
  createHistoProduct(productId){
    return Api().post(`/api/products/createHistoProduct/${productId}` )
  },
  QuantityProduct(credentials) {
    return Api().put("/api/products/quantity",credentials);
  },
  AupdateProduct(productId) {
    return Api().put(`/api/products/Admin-update-product/${productId}`);
  },
  SupdateProduct(productId) {
    return Api().put(`/api/products/Supplier-update-product/${productId}`);
  },
  deleteProduct(productId) {
    return Api().delete(`/api/products/deleteProduct/${productId}`);
  },
};
