<template>
    <div>
      <b-container>
        <b-row>
          <b-col cols="6">
            <b-card class="mt-5" style="color: #001e5f">
              <h2>
                <strong>Page non trouvée. </strong>
              </h2>
              <div class="mt-4">
                Nous n'avons aucune information à ce sujet {{ paramName }}.
                <br />
              {{ paramName }}  pourrait être retiré du site Web.
                <br />
                Ou vous avez peut-être cliqué sur un lien invalide.
                <br />
                Aller à
                <b-link :to="routerLink">
                  {{ pageToNavigate }}
                  <b-icon icon="arrow-right" />
                </b-link>
              </div>
            </b-card>
          </b-col>
        </b-row>
      </b-container>
    </div>
  </template>
  
  <script>
  export default {
    name: "InvalidParameter",
    props: {
      paramName: {
        required: true,
        type: String,
      },
      pageToNavigate: {
        required: true,
        type: String,
      },
      routerLink: {
        required: true,
        type: String,
      },
    },
    components: {},
    data() {
      return {};
    },
    computed: {},
    mounted() {},
    methods: {},
  };
  </script>
  
  <style lang="scss" scoped></style>
  