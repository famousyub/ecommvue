<template>
  <div>
    <b-row>
      <b-col
        cols="6"
        v-for="product in checkoutProduct"
        :key="product.productId"
      >
        <b-card-group deck>
          <b-card img-top style="max-width: 14rem" class="mb-4">
            <b-card-img
              :src="product.image"
              style="max-width: 14rem; max-height: 14rem"
              alt="Image Not Found"
            />
            <br />
            <b-link :to="{ path: `/product/${product.productId}` }">
              {{ product.title }}
            </b-link>
            <br />
            <small class="mt-2">
              Price: {{ product.amount }} {{ product.currency }}
            </small>
            <br />
            <small class="mt-2">Quantité: {{ product.quantity }}</small>
            <br />
            <small class="mt-2">
              Cost: {{ product.amount * product.quantity }}
              {{ product.currency }}
            </small>
          </b-card>
        </b-card-group>
      </b-col>
    </b-row>
    <b-row class="mt-5">
      <b-col cols="2" />
      <b-col cols="10">
        <b-card class="mt-5" v-if="subTotalAmount != 0">
          <b-row>
            <b-col cols="8">
              <h5>Total Produits</h5>
            </b-col>
            <b-col cols="4">
              <b-card-text>
                {{ subTotalAmount }} {{ selectedCurrency }}
              </b-card-text>
            </b-col>
          </b-row>
          <b-row>
            <b-col cols="8">
              <h5>Tarif d'expédition</h5>
            </b-col>
            <b-col cols="4">
              <b-card-text>
                {{ shippingRate }} {{ selectedCurrency }}
              </b-card-text>
            </b-col>
          </b-row>
          <hr />
          <b-row>
            <b-col cols="8">
              <h5>Total</h5>
            </b-col>
            <b-col cols="4">
              <b-card-text>
                {{ totalAmount }} {{ selectedCurrency }}
              </b-card-text>
            </b-col>
          </b-row>
        </b-card>
      </b-col>
    </b-row>
    <b-row>
      <b-col>
        <b-alert
          variant="primary"
          class="mb-0 mt-5 p-1 pl-2"
          :show="!formValidate"
        >
          {{ message }}
        </b-alert>
      </b-col>
    </b-row>
    <b-row class="mt-4" v-if="subTotalAmount != 0">
      <b-col cols="5">
        <b-button block variant="warning" to="/cart-view">Modifier Panier</b-button>
     
      </b-col>
      <b-col cols="2" />
      <b-col>
        <b-button
          v-if="!payBtnSpin"
          @click="checkoutApplied"
          block
          variant="success"
          
          >
          <b-icon icon="cursor-fill" />
          Vérifier la commande
        </b-button>
       
      
        <b-button v-if="payBtnSpin && quantityValidation"  @click="checkoutApplied"   block variant="success">
          Vérification...
          <b-icon-check small variant="light"></b-icon-check>
          
        </b-button>
        <b-button v-if="payBtnSpin && !quantityValidation"  @click="checkoutApplied"   block variant="success">
          Quantité insuffisantes
          <b-icon-x small variant="light"></b-icon-x>
          
        </b-button>
        <b-button block variant="success" @click="removeCartItem()" to="/successful">Confirme</b-button>
      </b-col>

    </b-row>
    <b-row v-if="subTotalAmount == 0">
      <b-col class="text-center">
        <h4>y a pas de produit pour passer!!!</h4>
      </b-col>
    </b-row>
  </div>
</template>

<script>

import OrderService from "@/services/OrderService.js";
import OrderItemService from "../../services/OrderItemService";
//import ProductsService from "../../services/ProductsService.js";


export default {
  name: "BuyItem",
  components: {},
  data() {
    return {
      selectedCurrency: "TND",
      payBtnSpin: false,
      subTotalAmount: 0,
      formValidate: true,
      message: "Remplissez le formulaire",
      shippingRate: this.$store.state.Checkout.shippingRate,
      totalAmount: 0,
      checkoutProduct: null,
      orderid : 4, 
      quantityValidation : true,
      //sales: 2,  
      products: [],
      product: [],
    };
  },
  computed: {},
  mounted() {
    
    this.checkoutProduct = this.$store.state.Cart.cartProducts;

    console.log(this.$store.state.Cart.cartProducts[0]);
    var i;
    for (i = 0; i < this.checkoutProduct.length; i++) {
      this.subTotalAmount +=
        this.checkoutProduct[i].amount * this.checkoutProduct[i].quantity;
      this.products[i] = this.checkoutProduct[i].quantity;
    
    }
    this.totalAmount = this.subTotalAmount + this.shippingRate;
   
  },
  methods: {
    


    async checkoutApplied() {
      const response = await this.$store.dispatch(
        "Checkout/informationValidate"
      );
      if (!response) {
        this.formValidate = false;
        return;
      }
      this.payBtnSpin = true;
      const customerName = response.name;
      const customerEmail = response.email;
      const customerPhoneNo = response.phoneNo;
      const shippingAddress = response.shippingAddress;
      var i;
      var checkoutItems = [];
      for (i = 0; i < this.checkoutProduct.length; i++) {
        var obj = {
          price_data: {
            unit_amount: this.checkoutProduct[i].amount ,
            currency: "TND",
            product_data: {
              name: this.checkoutProduct[i].title,
            },
          },
          quantity: this.checkoutProduct[i].quantity,
        };
        checkoutItems.push(obj);
      }
      checkoutItems.push({
        price_data: {
          unit_amount: this.shippingRate ,
          currency: "TND",
          product_data: {
            name: "Shipping Cost",
          },
        },
        quantity: 1,
      });
     console.log(this.checkoutProduct[0].quantity +"hi")
     console.log(this.checkoutProduct[0].sales +"ha")
       
       try {
        for (i = 0; i < this.checkoutProduct.length; i++) {

          if(this.checkoutProduct[i].quantity > this.checkoutProduct[i].sales){
          
            this.quantityValidation = false;
            this.$bvToast.toast("Quantité non suffisantes", {
            title: "Quantité",
            variant: "warning",
            toaster: "b-toaster-top-center",
            noCloseButton: false,
            solid: true,
          });
          }else 

         console.log("ok")
          
        } 
        if (this.quantityValidation){
         
          const order = (
          await OrderService.createOrder({
            
            name: customerName,
            
            email: customerEmail,
            phoneNo: customerPhoneNo,
            address: shippingAddress,
            status: "en cours",
            variant: "dark",
            checkoutSessionId: 76,
            productCost: this.totalAmount,
            currency :"TND",
            shippingCost: 4.000,

          })  
        ).data;
            console.log(order);
          

        }
      } catch (error) {
        console.log(error.response.data.error);
      }
        
      try {
        for (i = 0; i < this.checkoutProduct.length; i++) {
        const orderitem =(await OrderItemService.createOrderItem({
            quantity: this.checkoutProduct[i].quantity,
            ProductId : this.checkoutProduct[i].productId,
            OrderId : this.order.id,
        })).data; 
        console.log(orderitem);
      }
      
      }catch (error) {
        console.log(error.response.data.error);
      }
      
      
    },
  
  },
};
</script>

<style lang="scss" scoped></style>
