<template>


  <div v-if="topSellProduct.length != 0">
    <h3>{{ topSellViewTitle }}</h3>
    <div class="row">
      <div class="col-md-4 col-sm-6" v-for="product in topSellProduct" :key="product.id">
        <b-card deck class="mt-4" style="height: auto;">
          <b-card-img
            style="height: 230px;"
            @click="$router.push({ path: `/product/${product.id}` })"
            class="mb-3 rounded-full max-w-none w-12 h-12"
            :src="product.image1"
          />
          <div class="flex flex-col">
            <div>
              <b-link @click="$router.push({ path: `/product/${product.id}` })">
                <h5>{{ product.title }}</h5>
              </b-link>
            </div>
            <div class="text-slate-500 dark:text-slate-300 dark:text-slate-400">
              <h6>Price: {{ Number(product.amount) }} {{ product.currency }}</h6>
            </div>
          </div>
          <div class="mt-2" align-v="center">
            <div>
              <b-form-rating  
                :precision="Math.round(product.rating) == product.rating ? 0 : 1"
                size="sm"
                show-value
                show-value-max
                :value="product.rating"
                variant="primary"
              />
            </div>
          </div>
          <div class="d-flex justify-content-between">
            <div class="btn">
              <AddToCart 
                class="mt-2"
                addButtonTitle="Ajouter au chariot"
                addedButtonTitle="dans chariot"
                buttonType="sm"
                :key="cartComponentKey"
                :productId="product.id"
                :rating="product.rating"
                :currency="product.currency"
                :image="product.image1"
                :title="product.title"
                :amount="Number(product.amount)"
                :sales="product.sales"
              />
              <AddToWishlist
                class="mt-2"
                :key="wishlistKey"
                addButtonTitle="Enregistrer"
                addedButtonTitle="Enregistré"
                buttonType="sm"
                :productId="product.id"
              />
            </div>
          </div>
        </b-card>
      </div>
    </div>
  </div>
</template>

  
  <script>
  import ProductsService from "@/services/ProductsService.js";
  import AddToCart from "@/components/MaintainProduct/AddToCart.vue";
  import AddToWishlist from "@/components/MaintainProduct/AddToWishlist.vue";

  //import Sidebar  from "@/components/Home/Sidebar.vue";
  import './TopSellerProd.css'
  import './topsellerprod.scss';
 // import './TopProducts.css';
  export default {
    name: "TopSellProduct",
    components: {
      AddToCart,
      AddToWishlist,
     // Sidebar
    },
    data() {
      return {
        topSellProduct: [],
        cartComponentKey: 0,
        wishlistKey: 2,
        topSellLimit: 20,
        topSellViewTitle: "Tous les produits",
      };
    },
    async mounted() {
      this.topSellProduct = (
        await ProductsService.topSellProduct(this.topSellLimit)
      ).data;
      this.forceRerender();
    },
    methods: {
      forceRerender() {
        this.cartComponentKey += 1;
        this.wishlistKey += 1;
      },
    },
    computed: {},
  };
  </script>
  
  <style lang="scss" scoped></style>
  