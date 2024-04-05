<template>
    <div>
      <b-dropdown
        id="cart-dd"
        v-if="validCartItem != -1"
        :size="buttonType"
        variant="info"
      >
        <template #button-content>
          <b-icon scale="1.2" icon="cart-check-fill" />
          {{ addedButtonTitle }}
        </template>
        <b-dropdown-item @click="removeCartItem">
          Supprimer du chariot
        </b-dropdown-item>
      </b-dropdown>
      <b-button
        v-if="validCartItem == -1"
        :size="buttonType"
        variant="outline-info"
        @click="addToCart"
      >
        <b-icon scale="1.2" icon="cart-plus-fill" />
        {{ addButtonTitle }}
      </b-button>
    </div>
  </template>
  
  <script>
  export default {
    name: "AddToCart",
    props: {
      addButtonTitle: {
        default: "",
        type: String,
      },
      addedButtonTitle: {
        default: "",
        type: String,
      },
      sales: Number,
      buttonType: String,
      productId: Number,
      currency: String,
      rating: Number,
      image: String,
      title: String,
      amount: Number,
    },
    computed: {},
    data() {
      return {
        validCartItem: -1,
      };
    },
    async mounted() {
      this.userId = this.$store.state.CurrentUser.userId;
      this.validCartItem = await this.$store.dispatch(
        "Cart/getCartItem",
        this.productId
      );
    },
    methods: {
      async addToCart() {
        if (this.userId == 0) {
          this.$bvToast.toast("Veuillez vous connecter pour enregistrer sur le chariot", {
            title: "Chariot",
            variant: "danger",
            toaster: "b-toaster-top-center",
            noCloseButton: false,
            solid: true,
          });
          return;
        }
        const cartItem = {
          sales: this.sales,
          productId: this.productId,
          title: this.title,
          image: this.image,
          rating: this.rating,
          currency: this.currency,
          amount: this.amount,
          quantity: 1,
        };
        this.validCartItem = await this.$store.dispatch(
          "Cart/addToCart",
          cartItem
        );
  
        if (this.validCartItem != -1) {
          this.$bvToast.toast("Produit ajouté au chariot", {
            title: "Chariot",
            variant: "primary",
            toaster: "b-toaster-top-center",
            noCloseButton: false,
            solid: true,
          });
        }
      },
      async removeCartItem() {
        this.validCartItem = await this.$store.dispatch(
          "Cart/removeCartItem",
          this.productId
        );
        if (this.validCartItem == -1) {
          this.$bvToast.toast("Produit retiré du chariot", {
            title: "Chariot",
            variant: "primary",
            toaster: "b-toaster-top-center",
            noCloseButton: false,
            solid: true,
          });
        }
      },
    },
  };
  </script>
  <style lang="scss" scoped></style>
  