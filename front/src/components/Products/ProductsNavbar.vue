<template>
    <div>
      <b-row>
        <b-col class="ml-2">
          <b-navbar toggleable="lg" type="primary" variant="white">
            <b-navbar-brand href="#" to="/products">
              <b-icon variant="primary" icon="house-door-fill" />
              <b-icon class="ml-2" scale=".7" icon="chevron-right" />
            </b-navbar-brand>
            <b-navbar-toggle target="nav-products-collapse">
              <b-button-toolbar>
                <b-button-group>
                  <b-button variant="outline-dark" class="px-3 py-2">
                    <b-icon scale="1.6" icon="list" />
                  </b-button>
                </b-button-group>
              </b-button-toolbar>
            </b-navbar-toggle>
            <b-collapse id="nav-products-collapse" is-nav>
              <b-navbar-nav class="mr-auto">
                <b-nav-item
                  class="mr-auto"
                  :to="`/products/${category.name}`"
                  v-if="category"
                >
                  {{ category.name }}
                  <b-icon class="ml-2" scale=".7" icon="chevron-right" />
                </b-nav-item>
                <b-nav-item
                  class="mr-auto"
                  :to="`/products/${category.name}/${subCategory.name}`"
                  v-if="subCategory"
                >
                  {{ subCategory.name }}
                  <b-icon class="ml-2" scale=".7" icon="chevron-right" />
                </b-nav-item>
                <b-nav-item
                  class="mr-auto"
                  :to="`/products/${category.name}/${subCategory.name}/${subSubCategory.name}`"
                  v-if="subSubCategory"
                >
                  {{ subSubCategory.name }}
                  <b-icon class="ml-2" scale=".7" icon="chevron-right" />
                </b-nav-item>
                <b-button
                  class="mr-auto"
                  v-if="admin === 1 "
                  to="/admin/add-product"
                  
                  size="m"
                  variant="outline-dark"
                  
                  >Ajouter Produit 
                  <b-icon class="mr-1" variant="primary" icon="plus-square" />
                  
                </b-button>
                  <b-button
                  v-if="supplier === 2"
                  to="/supplier/add-product"
                  
                  size="m"
                  variant="outline-dark" 
                >
                Ajouter Produit
                  <b-icon  class="mr-1" variant="primary" icon="plus-square" />
                  
                </b-button>
              </b-navbar-nav>
         
            </b-collapse>
          </b-navbar>
          <hr class="m-0" />
        </b-col>
      </b-row>
    </div>
  </template>
  
  <script>
  import CategoryService from "@/services/CategoryService.js";
  import SubCategoryService from "@/services/SubCategoryService.js";
  import SubSubCategoryService from "@/services/SubSubCategoryService.js";
  export default {
    name: "ProductsNavbar",
    components: {},
    data() {
      return {
        adminn: false,
        supplierr: false,
        admin: false,
        supplier:false,
        searchText: "",
        category: "",
        subCategory: "",
        subSubCategory: "",
      };
    },
    async mounted() {
   
      this.admin = this.$store.state.CurrentUser.user.priority;
      this.supplier = this.$store.state.CurrentUser.user.priority;
      console.log(this.admin);
      console.log(this.$store.state.CurrentUser);
      console.log(this.$store.state.CurrentUser.user.priority)
      console.log(this.supplier);
      if (this.$route.query.q) this.searchText = this.$route.query.q;
  
      if (this.$route.params.subSubCategory) {
        this.subSubCategory = (
          await SubSubCategoryService.getSubSubCategoryByName(
            this.$route.params.subSubCategory
          )
        ).data;
      }
      if (this.$route.params.subCategory) {
        this.subCategory = (
          await SubCategoryService.getSubCategoryByName(
            this.$route.params.subCategory
          )
        ).data;
      }
      if (this.$route.params.category) {
        this.category = (
          await CategoryService.getCategoryByName(this.$route.params.category)
        ).data;
      }
    },
    methods: {
      search() {
        if (this.searchText) {
          this.$router.push({
            path: `${this.$route.path}?q=${this.searchText}`,
          });
        }
      },
    },
  };
  </script>
  
  <style lang="scss" scoped></style>
  