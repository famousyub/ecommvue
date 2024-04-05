<template>
    <div id="product-list">



      <div class="w-[1190px] mx-auto my-auto">
  <div class="flex flex-col w-full h-auto mt-[3%]">
    <div class="flex flex-wrap">
      <section class="section">

<div class="container">
      <b-row>
        <b-col cols="4" v-for="product in displayProducts1" :key="product.id">
          <b-card-group deck  style ="height: 500px;  ">
            <b-card img-top style="max-width: 25rem" class="mb-4">
              <b-card-img
              style ="height: 200px; "
                @click="$router.push({ path: `/product/${product.id}` })"
                :src="product.image1"
                alt="Image Not Found"
              />
              <div class="mt-2">
                <b-link :to="`/product/${product.id}`">
                  {{ product.title }}
                </b-link>
              </div>
              <h6 class="mt-1">
                Prix: {{ product.amount }} {{ product.currency }}
              </h6>
              <b-row class="mt-2" align-v="center">
                <b-col cols="12">
                  <b-form-rating
                    :precision="
                      Math.round(product.rating) == product.rating ? 0 : 1
                    "
                    size="sm"
                    show-value
                    show-value-max
                    readonly
                    :value="product.rating"
                    variant="primary"
                  />
                </b-col>
              </b-row>
              <div class="d-flex justify-content-between">
                <AddToCart
                  class="mt-2"
                  addButtonTitle="Ajouter au chariot"
                  addedButtonTitle="dans chariot"
                  :key="cartComponentKey"
                  buttonType="sm"
                  :productId="product.id"
                  :rating="product.rating"
                  :currency="product.currency"
                  :image="product.image1"
                  :title="product.title"
                  :amount="product.amount"
                />
                <AddToWishlist
                  class="mt-2"
                  addButtonTitle="Enregistrer"
                  addedButtonTitle="Enregistré"
                  :key="wishlistKey"
                  buttonType="sm"
                  :productId="product.id"
                />
              </div>
              <b-button
                v-if="admin"
                class="mt-2"
                @click="deleteProduct(product)"
                size="sm"
                variant="danger"
              >
                <b-icon icon="trash" />
                Supprimer
              </b-button>
              <b-button
                v-if="supplier"
                class="mt-2"
                @click="deleteProduct(product)"
                size="sm"
                variant="danger"
              >
                <b-icon icon="trash" />
                Supprimer
              </b-button>
            </b-card>
          </b-card-group>
        </b-col>
      </b-row>




      <b-row class="mt-3 mb-5" v-if="this.apCount == 0">
        <b-col>
          <h2>...</h2>
        </b-col>
      </b-row>
      <b-row v-if="this.apCount != 0" class="mt-3" align-v="center">
        <b-col>
          <b-pagination
            size=""
            v-model="currentPage"
            :total-rows="apCount"
            :per-page="perPage"
            @input="paginate(currentPage)"
          ></b-pagination>
        </b-col>
        <b-col />
        <b-col>
          <h6>
          MONTRANT {{ (currentPage - 1) * perPage + 1 }} à
            {{
              currentPage * perPage > apCount ? apCount : currentPage * perPage
            }}
            de {{ apCount }} ({{ Math.ceil(apCount / perPage) }}
            PAGES)
          </h6>
        </b-col>
      </b-row>

</div>
</section>


    </div>

  </div>
      </div>



   
    </div>
  </template>
  
  <script>
  import AddToCart from "@/components/MaintainProduct/AddToCart.vue";
  import AddToWishlist from "@/components/MaintainProduct/AddToWishlist.vue";
  import ProductsService from "@/services/ProductsService.js";
  import WishlistService from "@/services/WishlistService.js";
  import { mapState } from "vuex";

  import './ProductList.css';
  export default {
    name: "ProductList",
    props: {},
    components: {
      AddToWishlist,
      AddToCart,
    },
    data() {
      return {
        admin: false,
        supplier: false,
        wishlistKey: 4,
        currentPage: 1,
        cartComponentKey: 2,
        productLimit: 8,
        displayProducts:[],
      };
    },
    computed: {
      ...mapState({
        displayProducts1: (state) => state.Products.displayProducts,
        apCount: (state) => state.Products.apCount,
        perPage: (state) => state.Products.perPage,
      }),
    },
   async mounted() {
      this.admin = this.$store.state.CurrentUser.admin;
      this.supplier = this.$store.state.CurrentUser.supplier;
     
    },
    methods: {
      refreshCartBtn() {
        this.cartComponentKey += 1;
        this.wishlistKey += 1;
      },
      async deleteProduct(product) {
        await WishlistService.deleteWishItemByProduct(product.id);
        await ProductsService.deleteProduct(product.id);
        await this.$store.dispatch("Products/setAllBackupProducts");
        await this.$store.dispatch("Wishlist/setWishlist");
        window.location.reload();
      },
      async paginate(currentPage) {
        await this.$store.dispatch("Products/paginate", currentPage);
        this.refreshCartBtn();
      },
    },
     
  };
  
   
 </script>
  
  <style lang="scss" scoped></style>
  