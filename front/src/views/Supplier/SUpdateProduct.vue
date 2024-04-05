<template>
    <div>
      <STopHeader />
  
      <b-container class="mt-4">
        <b-card>
          <b-navbar text-variant="white" variant="info">
            <b-navbar-brand style="color: #fff">Modifier le produit</b-navbar-brand>
          </b-navbar>
          <b-form
            @reset="resetProduct"
            @submit.stop.prevent="updateProduct"
            class="mt-3"
          >
            <b-row cols="1" cols-md="2">
              <b-col>
                <b-form-group
                  id="input-group-title"
                  label=" Titre du produit"
                  label-for="input-title"
                >
                  <b-form-input
                    id="input-title"
                    v-model="product.title"
                    placeholder="Entrez le nom du produit"
                    required
                  />
                </b-form-group>
                <b-row>
                  <b-col>
                    <b-form-group
                      id="input-group-amount"
                      label="Prix"
                      label-for="input-amount"
                    >
                      <b-form-input
                        id="input-amount"
                        v-model="product.amount"
                        placeholder="Prix"
                        required
                      />
                    </b-form-group>
                  </b-col>
                  <b-col>
                    <b-form-group
                      id="input-group-currency"
                      label="Devise"
                      label-for="input-currency"
                    >
                      <b-form-input
                        id="input-currency"
                        v-model="product.currency"
                        readonly
                        required
                      />
                    </b-form-group>
                  </b-col>
                </b-row>
                <div>
                  <b-form-group
                    id="input-group-overview"
                    label="Aperçu"
                    label-for="input-overview"
                  >
                    <vue-editor
                      @keyup="
                        productSubTitleAlert ? (productSubTitleAlert = false) : 1
                      "
                      required
                      id="input-overview"
                      v-model="product.subtitle"
                    >
                    </vue-editor>
                  </b-form-group>
                </div>
              </b-col>
              <b-col>
                <b-form-group label="catégorie de produit">
                  <b-row>
                    <b-col>
                      <b-dropdown
                        id="dropdown-category"
                        :text="selectedCategory"
                        variant="warning"
                        block
                        menu-class="w-100"
                      >
                        <b-dropdown-item
                          v-for="category in categoryList"
                          :key="category.id"
                          @click="set_category(category)"
                        >
                          {{ category.name }}
                        </b-dropdown-item>
                        <b-dropdown-form @submit.stop.prevent="createNewCateg">
                          <b-row>
                            <b-col>
                              <b-form-input
                                required
                                v-model="newCategoryName"
                                placeholder="Nom de catégorie"
                              />
                            </b-col>
                            <b-col>
                              <b-button type="submit" block variant="warning">
                                Créer
                              </b-button>
                            </b-col>
                          </b-row>
                        </b-dropdown-form>
                      </b-dropdown>
                    </b-col>
                  </b-row>
                  <b-row class="mt-4">
                    <b-col>
                      <b-dropdown
                        id="dropdown-subCategory"
                        :text="selectedSubCategory"
                        variant="warning"
                        block
                        menu-class="w-100"
                        :disabled="product.CategoryId == 0"
                      >
                        <div
                          v-for="subCategory in subCategoryList"
                          :key="subCategory.id"
                        >
                          <b-dropdown-item
                            v-if="subCategory.categoryId === product.CategoryId"
                            @click="set_subCategory(subCategory)"
                          >
                            {{ subCategory.name }}
                          </b-dropdown-item>
                        </div>
                        <b-dropdown-form @submit.stop.prevent="createNewSubCateg">
                          <b-row>
                            <b-col>
                              <b-form-input
                                required
                                v-model="newSubCategoryName"
                                placeholder="Sub Category Name"
                              />
                            </b-col>
                            <b-col>
                              <b-button type="submit" block variant="warning">
                                Créer
                              </b-button>
                            </b-col>
                          </b-row>
                        </b-dropdown-form>
                      </b-dropdown>
                    </b-col>
                  </b-row>
                  <b-row class="mt-4">
                    <b-col>
                      <b-dropdown
                        id="dropdown-subSubCategory"
                        :text="selectedSubSubCategory"
                        variant="warning"
                        block
                        menu-class="w-100"
                        :disabled="product.SubCategoryId == 0"
                      >
                        <div
                          v-for="subSubCategory in subSubCategoryList"
                          :key="subSubCategory.id"
                        >
                          <b-dropdown-item
                            v-if="
                              subSubCategory.subCategoryId === product.SubCategoryId
                            "
                            @click="set_subSubCategory(subSubCategory)"
                          >
                            {{ subSubCategory.name }}
                          </b-dropdown-item>
                        </div>
                        <b-dropdown-form
                          @submit.stop.prevent="createNewSubSubCateg"
                        >
                          <b-row>
                            <b-col>
                              <b-form-input
                                required
                                v-model="newSubSubCategoryName"
                                placeholder="Sub Sub Category Name"
                              />
                            </b-col>
                            <b-col>
                              <b-button type="submit" block variant="warning">
                                Créer
                              </b-button>
                            </b-col>
                          </b-row>
                        </b-dropdown-form>
                      </b-dropdown>
                    </b-col>
                  </b-row>
                </b-form-group>
              </b-col>
            </b-row>
  
            <b-form-group
              id="input-group-description"
              label="Description"
              label-for="input-description"
            >
              <vue-editor
                @keyup="
                  productDescriptionAlert ? (productDescriptionAlert = false) : 1
                "
                required
                id="input-description"
                v-model="product.description"
              >
              </vue-editor>
            </b-form-group>
  
            <b-button type="submit" @click="update()" variant="primary">Mettre à jour le produit</b-button>
          </b-form>
        </b-card>
      </b-container>
      <MyFooter class="mt-5" />
    </div>
  </template>
  
  <script>
  import ProductsService from "@/services/ProductsService.js";
  import CategoryService from "@/services/CategoryService.js";
  import SubCategoryService from "@/services/SubCategoryService.js";
  import SubSubCategoryService from "@/services/SubSubCategoryService.js";
  import STopHeader from "@/components/Supplier/STopHeader.vue";
  import MyFooter from "@/components/Common/MyFooter.vue";
  import { VueEditor } from "vue2-editor";
  export default {
    name: "EditProduct",
    components: {
      STopHeader,
      VueEditor,
      MyFooter,
    },
    data() {
      return {
        images: [],
        newCategoryName: "",
        newSubCategoryName: "",
        newSubSubCategoryName: "",
        categoryList: [],
        subCategoryList: [],
        subSubCategoryList: [],
        selectedCategory: "Category Name",
        selectedSubCategory: "Sub Category Name",
        selectedSubSubCategory: "Sub Sub Category Name",
        product: {
          title: "",
          subtitle: "",
          description: "",
          amount: "",
          currency: "TND",
          CategoryId: 0,
          SubCategoryId: 0,
          SubSubCategoryId: 0,
        },
        productTitleAlert: false,
        productSubTitleAlert: false,
        productDescriptionAlert: false,
      };
    },
    mounted() {
      this.fetchCategoryList();
      this.fetchSubCategoryList();
      this.fetchSubSubCategoryList();
      this.fetchProduct();
    },
    methods: {
      update(){
      this.$bvToast.toast("Produit a été modifier", {
        title: "Mettre à jour",
        variant: "success",
        toaster: "b-toaster-top-center",
        noCloseButton: false,
        solid: true,
      });
    },



      fetchCategoryList() {
        CategoryService.getCategoryList()
          .then((response) => {
            this.categoryList = response.data;
          })
          .catch((error) => {
            console.log(error);
          });
      },
      fetchSubCategoryList() {
        SubCategoryService.getSubCategoryList()
          .then((response) => {
            this.subCategoryList = response.data;
          })
          .catch((error) => {
            console.log(error);
          });
      },
      fetchSubSubCategoryList() {
        SubSubCategoryService.getSubSubCategoryList()
          .then((response) => {
            this.subSubCategoryList = response.data;
          })
          .catch((error) => {
            console.log(error);
          });
      },
      fetchProduct() {
        const productId = this.$route.params.productId;
        console.log(productId);
        ProductsService.getProduct(productId)
          .then((response) => {
            console.log(response);
            this.product = response.data;
            this.selectedCategory = this.product.Category.name;
            this.selectedSubCategory = this.product.SubCategory.name;
            this.selectedSubSubCategory = this.product.SubSubCategory.name;
            
          })
          .catch((error) => {
            console.log(error);
          });
      },
      resetProduct() {
        this.product = {
          title: "",
          subtitle: "",
          description: "",
          amount: "",
          currency: "TND",
          CategoryId: 0,
          SubCategoryId: 0,
          SubSubCategoryId: 0,
        };
        this.selectedCategory = "Category Name";
        this.selectedSubCategory = "Sub Category Name";
        this.selectedSubSubCategory = "Sub Sub Category Name";
        this.productTitleAlert = false;
        this.productSubTitleAlert = false;
        this.productDescriptionAlert = false;
      },
      updateProduct() {
        if (!this.product.title) {
          this.productTitleAlert = true;
          return;
        }
        if (!this.product.subtitle) {
          this.productSubTitleAlert = true;
          return;
        }
        if (!this.product.description) {
          this.productDescriptionAlert = true;
          return;
        }
        ProductsService.createHistoProduct(this.product)
        ProductsService.SupdateProduct(this.product)
          .then(() => {
            // Handle success
           window.location.reload();
          })
          .catch((error) => {
            // Handle error
            console.log(error);
          });
      },
      set_category(category) {
        this.selectedCategory = category.name;
        this.product.CategoryId = category.id;
      },
      createNewCateg() {
        CategoryService.createCategory({ name: this.newCategoryName })
          .then((response) => {
            this.categoryList.push(response.data);
            this.selectedCategory = response.data.name;
            this.product.CategoryId = response.data.id;
            this.newCategoryName = "";
          })
          .catch((error) => {
            console.log(error);
          });
      },
      set_subCategory(subCategory) {
        this.selectedSubCategory = subCategory.name;
        this.product.SubCategoryId = subCategory.id;
      },
      createNewSubCateg() {
        SubCategoryService.createSubCategory({
          name: this.newSubCategoryName,
          categoryId: this.product.CategoryId,
        })
          .then((response) => {
            this.subCategoryList.push(response.data);
            this.selectedSubCategory = response.data.name;
            this.product.SubCategoryId = response.data.id;
            this.newSubCategoryName = "";
          })
          .catch((error) => {
            console.log(error);
          });
      },
      set_subSubCategory(subSubCategory) {
        this.selectedSubSubCategory = subSubCategory.name;
        this.product.SubSubCategoryId = subSubCategory.id;
      },
      createNewSubSubCateg() {
        SubSubCategoryService.createSubSubCategory({
          name: this.newSubSubCategoryName,
          subCategoryId: this.product.SubCategoryId,
        })
          .then((response) => {
            this.subSubCategoryList.push(response.data);
            this.selectedSubSubCategory = response.data.name;
            this.product.SubSubCategoryId = response.data.id;
            this.newSubSubCategoryName = "";
          })
          .catch((error) => {
            console.log(error);
          });
      },
    },
  };
  </script>
  
  <style scoped>
  #input-description .ql-container.ql-snow {
    min-height: 300px;
  }
  
  #input-overview .ql-container.ql-snow {
    min-height: 200px;
  }
  </style>
  