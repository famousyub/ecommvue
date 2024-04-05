<template>
    <div>
      <ul style="list-style: none">
        <div v-for="subCategory in subCategoryList" :key="subCategory.id">
          <li
            v-if="searchParameter.categoryId == subCategory.CategoryId"
            class="mb-1"
          >
            <b-row v-if="subCategory.mode == 0">
              <div :class="{'col-12': !adminS  ===1 || !supplierA ===2, 'col-8': adminS ===1 || supplierA === 3  }">
                <b-link
                  variant="white"
                  :to="`${$route.path}/${subCategory.name}`"
                >
                  <small>{{ subCategory.name }}</small>
                  <b-icon
                    variant="primary"
                    icon="triangle-fill"
                    scale="0.5"
                    rotate="90"
                    shift-v="-2"
                  />
                </b-link>
              </div>
  
              <b-col cols="4" v-if="admin ">
                <b-button-toolbar>
                  <b-button-group size="sm">
                    <b-button @click="subCategory.mode ^= 1" variant="white">
                      <b-icon
                        variant="primary"
                        v-b-tooltip.hover
                        title="Modifier"
                        icon="pen"
                      />
                    </b-button>
  
                    <b-button
                      @click="deleteSubCategory(subCategory)"
                      variant="white"
                    >
                      <b-icon
                        variant="danger"
                        v-b-tooltip.hover
                        title="Delete"
                        icon="trash"
                      />
                    </b-button>
                  </b-button-group>
                </b-button-toolbar>
              </b-col>
            </b-row>
            <b-form
              v-if="subCategory.mode == 1"
              @submit.stop.prevent="updateSubCategory(subCategory)"
            >
              <b-row>
                <b-col cols="8">
                  <b-form-group>
                    <b-form-input
                      size="sm"
                      required
                      v-model="subCategory.name"
                      placeholder="Nom de catégorie"
                    />
                  </b-form-group>
                </b-col>
                <b-col cols="4">
                  <b-button-toolbar>
                    <b-button-group size="sm">
                      <b-button type="submit" variant="white">
                        <b-icon
                          variant="primary"
                          v-b-tooltip.hover
                          title="Enregistrer"
                          icon="check2"
                        />
                      </b-button>
                      <b-button @click="subCategory.mode ^= 1" variant="white">
                        <b-icon
                          variant="danger"
                          v-b-tooltip.hover
                          title="Annuler"
                          icon="x"
                        />
                      </b-button>
                    </b-button-group>
                  </b-button-toolbar>
                </b-col>
              </b-row>
            </b-form>
          </li>
        </div>
        <div v-if="adminS === 1 || supplierA ===2 ">
          <b-card>
            <b-form @submit.stop.prevent="createNewSubCateg">
              <b-form-group>
                <b-form-input
                  size="sm"
                  required
                  v-model="newSubCategory"
                  placeholder="Nom de catégorie"
                />
              </b-form-group>
              <b-button size="sm" type="submit" variant="warning">
                Créer
              </b-button>
            </b-form>
          </b-card>
        </div>
      </ul>
    </div>
  </template>
  
  <script>
  import { mapState } from "vuex";
  import SubCategoryService from "@/services/SubCategoryService.js";
  
  export default {
    name: "SubCategorySidebar",
    data() {
      return {
        newSubCategory: "",
        searchParameter: {},
        subCategoryList: [],
      };
    },
    computed: {
      ...mapState({
        admin: (state) => state.CurrentUser.admin,
    
      }),
    },
  
    async mounted() {
      this.adminS = this.$store.state.CurrentUser.user.priority;
      this.supplierA = this.$store.state.CurrentUser.user.priority;
      this.searchParameter = this.$store.state.Products.searchParameter;
      this.subCategoryList = await this.$store.dispatch(
        "Category/getSubCategoryList"
      );
      this.subCategoryList = this.subCategoryList.map((obj) => ({
        ...obj,
        mode: 0,
      }));
    },
    methods: {
      async createNewSubCateg() {
        try {
          await SubCategoryService.createSubCategory({
            name: this.newSubCategory,
            CategoryId: this.searchParameter.categoryId,
          });
          await this.$store.dispatch("Category/setSubCategoryList");
          window.location.reload();
        } catch (error) {
          console.log(error.response.data.error);
        }
      },
      async updateSubCategory(subCategory) {
        try {
          delete subCategory.mode;
          await SubCategoryService.updateSubCategory(subCategory);
          await this.$store.dispatch("Category/setSubCategoryList");
          window.location.reload();
        } catch (error) {
          console.log(error.response.data.error);
        }
      },
      async deleteSubCategory(subCategory) {
        try {
          await SubCategoryService.deleteSubCategory(subCategory.id);
          await this.$store.dispatch("Category/setSubCategoryList");
          window.location.reload();
        } catch (error) {
          console.log(error.response.data.error);
        }
      },
    },
  };
  </script>
  
  <style scoped lang="scss"></style>
  