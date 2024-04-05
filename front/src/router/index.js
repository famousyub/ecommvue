import Vue from "vue";
import store from "@/store";
import VueRouter from "vue-router";
import Home from "@/views/Home.vue";
import AllProducts from "@/views/Product/AllProducts.vue";
import CategoryProducts from "@/views/Product/CategoryProducts.vue";
import SubCategoryProducts from "@/views/Product/SubCategoryProducts.vue";
import SubSubCategoryProducts from "@/views/Product/SubSubCategoryProducts.vue";
import ProductDetails from "@/views/Product/ProductDetails.vue";
import CartView from "@/views/UsersProduct/CartView.vue";
import Wishlist from "@/views/UsersProduct/Wishlist.vue";
import Checkout from "@/views/BuyProduct/Checkout.vue";
import Order from "@/views/BuyProduct/ViewOrder.vue";
import Successful from "@/views/Paymoney/Successful.vue";
import AddCompany from "@/views/Admin/AddCompany.vue"
import AboutUs from "@/views/AboutUs.vue";
import Register from "@/views/User/Register.vue";
import Login from "@/views/User/Login.vue";
import UserProfile from "@/views/User/Profile.vue";
import UserVerify from "@/views/User/UserVerify.vue";
import ResetPassword from "@/views/User/ResetPassword.vue";
import ADashboard from "@/views/Admin/ADashboard.vue";
import AUsers from "@/views/Admin/AUsers.vue";
import AOrders from "@/views/Admin/AOrders.vue";
import AOrder from "@/views/Admin/AOrder.vue";
import AProfile from "@/views/Admin/AProfile.vue";
import AddProduct from "@/views/Admin/AddProduct.vue";
import SAddProduct from "@/views/Supplier/SAddProduct.vue";
import Unauthorized from "@/views/ErrorPage/Unauthorized.vue";
import NotFound from "@/views/ErrorPage/NotFound.vue";
import SProfile from "@/views/Supplier/SProfile.vue";
import SDashboard from "@/views/Supplier/SDashboard.vue";
import AddSupplier from "@/views/Admin/AddSupplier.vue";
import AUpdateProduct from "@/views/Admin/AUpdateProduct.vue"
import SUpdateProduct from "@/views/Supplier/SUpdateProduct.vue"
import NewContract from "@/views/Admin/NewContract.vue";
Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "home",
    component: Home,
    meta: { title: "Home | EShopping" },
  },
  {
    path: "/products",
    name: "all-products",
    component: AllProducts,
    meta: { title: "Products page | EShopping" },
  },
  {
    path:"/admin/addCompany",
    name: "Add-Company",
    component:AddCompany,
    meta: { title: "Add Company | EShopping" },
  },
  {
    path: "/products/:category",
    name: "category-products",
    component: CategoryProducts,
    meta: { title: "Products page | EShopping" },
  },
  {
    path: "/products/:category/:subCategory",
    name: "sub-category-products",
    component: SubCategoryProducts,
    meta: { title: "Products page | EShopping" },
  },
  {
    path: "/products/:category/:subCategory/:subSubCategory",
    name: "sub-sub-category-products",
    component: SubSubCategoryProducts,
    meta: { title: "Products page | EShopping" },
  },
  {
    path: "/product/:productId",
    name: "product-details",
    component: ProductDetails,
    meta: { title: "Product details | EShopping" },
  },
  {
    path: "/cart-view",
    name: "cart-view",
    component: CartView,
    meta: { title: "Cart | EShopping" },
  },
  {
    path: "/wishlist",
    name: "wishlist",
    component: Wishlist,
    meta: { title: "Wishlist | EShopping" },
  },
  {
    path: "/checkout",
    name: "checkout",
    component: Checkout,
    meta: { title: "Checkout | EShopping" },
  },
  {
    path: "/order/:sessionId",
    name: "order",
    component: Order,
    meta: { title: "Order details | EShopping" },
  },
  
  {
    path: "/about-us",
    name: "about-us",
    component: AboutUs,
    meta: { title: "About us | EShopping" },
  },
  {
    path: "/register",
    name: "register",
    component: Register,
    meta: { title: "Register | EShopping" },
  },
  {
    path: "/login",
    name: "login",
    component: Login,
    meta: { title: "Login | EShopping" },
  },
  {
    path: "/successful",
    name: "success",
    component: Successful,
    meta: { title: "Successful | EShopping" },
  },
  {
    path: "/profile",
    name: "profile",
    component: UserProfile,
    meta: { title: "Profile | EShopping" },
  },
  {
    path: "/user-verify",
    name: "user-verify",
    component: UserVerify,
    meta: { title: "Email verification | EShopping" },
  },
  {
    path: "/reset-password/:token",
    name: "reset-password",
    component: ResetPassword,
    meta: { title: "Reset password | EShopping" },
  },
  {
    path: "/admin",
    name: "admin",
    component: ADashboard,
    meta: { requiresAuth: true, title: "Admin panel | EShopping" },
  },
  {
    path: "/admin/newContract",
    name: "New-Contract",
    component: NewContract,
    meta: { title: "New Contract | EShopping" },
  },
  {
    path: "/admin/users",
    name: "admin-users",
    component: AUsers,
    meta: { requiresAuth: true, title: "Shop users | EShopping" },
  },
  {
    path: "/admin/orders",
    name: "admin-orders",
    component: AOrders,
    meta: { requiresAuth: true, title: "Order list | EShopping" },
  },
  {
    path: "/admin/order/:orderId",
    name: "admin-order",
    component: AOrder,
    meta: { requiresAuth: true, title: "Order details | EShopping" },
  },
  {
    path: "/admin/profile",
    name: "admin-profile",
    component: AProfile,
    meta: { requiresAuth: true, title: "Admin profile | EShopping" },
  },
  {
    path: "/admin/add-product",
    name: "admin-add-product",
    component: AddProduct,
    meta: { requiresAuth: true, title: "Add product | EShopping" },
  },
  {
    path: "/admin/addSupplier",
    name: "admin-add-Supplier",
    component: AddSupplier,
    meta: { requiresAuth: true, title: "Add Supplier | EShopping" },
  },
  {
    path: "/admin/addSupplier/user-verify",
    name: "SUserVerify",
    component: AddSupplier,
    meta: { requiresAuth: true, title: "Verify Supplier | EShopping" },
  },
  {
    path: "/supplier",
    name: "supplier",
    component: SDashboard,
    meta: { requiresAuth: true, title: "Supplier panel | EShopping" },
  },
  {
    path: "/supplier/profile",
    name: "supplier-profile",
    component: SProfile,
    meta: { requiresAuth: true, title: "Supplier profile | EShopping" },
  },
  {
    path: "/supplier/add-product",
    name: "supplier-add-product",
    component: SAddProduct,
    meta: { requiresAuth: true, title: "Add product | EShopping" },
  },
  {
    path: "/error/401",
    name: "unauthorized",
    component: Unauthorized,
    meta: { title: "Unauthorized | EShopping" },
  },
  {
    path: "/Admin-update-product/:productId",
    name: "update-product",
    component: AUpdateProduct,
    meta: { title: "Update Product | EShopping" },
  },
  {
    path: "/Supplier-update-product/:productId",
    name: "update-product",
    component: SUpdateProduct,
    meta: { title: "Update Product | EShopping" },
  },
  {
    path: "/*",
    name: "not-found",
    component: NotFound,
    meta: { title: "Not found | EShopping" },
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

router.beforeEach((to, from, next) => {
  document.title = to.meta.title;
  const requiresAuth = to.matched.some((record) => record.meta.requiresAuth);
  const admin = store.state.CurrentUser.admin;
  
  
  const priority=store.state.CurrentUser.priority;
  if (requiresAuth && !admin ) {
    next("/error/401");
  } else if (requiresAuth && admin && priority ==2) {
    next();
  }else if (requiresAuth && admin && priority ==1) {
      next();
  } else {
    next();
  }
});

export default router;
