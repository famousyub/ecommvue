<template>
    <div>
      <b-row>
        <b-col>
          <h5>Profile</h5>
          <hr />
        </b-col>
      </b-row>
      <div>
        <div v-if="admin">
          Role
          <br />
          <b-button class="mt-2" :variant="user.variant">
            {{ user.userType }}
          </b-button>
          <hr />
        </div>
        <div>
          <b-button
            v-b-modal.delete-account-confirmation
            variant="outline-danger"
          >
            Fermer mon compte
          </b-button>
          <br />
          <p class="mt-2">
            Une fois votre compte supprimé, vous ne pourrez plus le rétablir.
          </p>
        </div>
      </div>
      <b-modal
        @shown="focusPasswordField"
        hide-footer
        id="delete-account-confirmation"
      >
        <template #modal-title> Es-tu sûr de vouloir faire ça? </template>
        <p>Nous supprimerons également toutes vos activités de notre serveur.</p>
  
        <label for="input-password">
          Pour être sûr, veuillez entrer votre
          <strong>Mot de passe actuel</strong>
        </label>
        <b-form-input
          type="password"
          @keyup="modalAlert = false"
          ref="passwordField"
          v-model="currentPassword"
          id="input-password"
        />
        <b-alert :show="modalAlert" variant="primary" class="my-2 p-1 pl-2">
          {{ deleteAccountError }}
        </b-alert>
        <b-row class="mt-3">
          <b-col cols="4" />
          <b-col cols="4">
            <b-button
              @click="$bvModal.hide('delete-account-confirmation')"
              block
              variant="warning"
            >
              Annuler
            </b-button>
          </b-col>
          <b-col cols="4">
            <b-button block @click="deleteAccount" variant="danger">
              Supprimer Compte
            </b-button>
          </b-col>
        </b-row>
      </b-modal>
    </div>
  </template>
  
  <script>
  import AuthenticationService from "@/services/AuthenticationService.js";
  import UserService from "@/services/UserService.js";
  import ReviewService from "@/services/ReviewService.js";
  export default {
    name: "UAccount",
    components: {},
    data() {
      return {
        userId: 0,
        user: {},
        admin: false,
        modalAlert: null,
        deleteAccountError: "",
        currentPassword: null,
      };
    },
    mounted() {
      this.userId = this.$store.state.CurrentUser.userId;
      this.user = this.$store.state.CurrentUser.user;
      this.admin = this.$store.state.CurrentUser.admin;
    },
    methods: {
      focusPasswordField() {
        this.$refs.passwordField.focus();
      },
      async deleteAccount() {
        var correctPassword = false;
        try {
          correctPassword = (
            await AuthenticationService.verifyPassword(this.currentPassword)
          ).data.correctPassword;
        } catch (error) {
          this.modalAlert = true;
          this.deleteAccountError = error.response.data.error;
          console.log(error.response.data.error);
        }
        if (correctPassword) {
          var reviewList = [];
          try {
            reviewList = (await ReviewService.getUsersReviewList(this.userId))
              .data;
          } catch (error) {
            console.log(error.response.data.error);
          }
          var i;
          for (i in reviewList) {
            await this.$store.dispatch("Review/deleteReview", reviewList[i]);
          }
          try {
            await UserService.deleteAccount(this.userId);
          } catch (error) {
            this.modalAlert = true;
            this.deleteAccountError = error.response.data.error;
          }
          this.$store.dispatch("CurrentUser/setToken", "");
          this.$store.dispatch("CurrentUser/setUser", {});
          this.$store.dispatch("Wishlist/clearWishlist");
          this.$router.push({ path: "/" });
        }
      },
    },
    computed: {},
  };
  </script>
  
  <style lang="scss" scoped></style>
  