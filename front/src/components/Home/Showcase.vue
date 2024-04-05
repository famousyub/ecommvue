<template>
    <div>
      <b-row>
        <b-col>
          <b-carousel
            v-model="slide"
            :interval="4000"
            controls
            indicators
            img-width="1440"
            img-height="720"
          >
            <b-carousel-slide
              v-for="showcaseSlide in showcaseSlides"
              :key="showcaseSlide.id"
              :caption="showcaseSlide.caption"
              
            >
              <template #img>
                <img class="img-fluid w-100" :src="showcaseSlide.image" style ="height:300px; width: 720px ;" />
              </template>
            </b-carousel-slide>
          </b-carousel>
        </b-col>
      </b-row>
  
    </div>
  </template>
  
  <script>
  import ShowcaseService from "@/services/ShowcaseService.js";
  export default {
    name: "Showcase",
    props: {},
    data() {
      return {
        showcaseSlides: [],
        showcaseCards: [],
        showcaseBigCards: [],
        admin: false,
        slide: 0,
        sliding: null,
        topCarousel: {
          perPage: 1,
          autoplay: true,
          autoplayTimeout: 4000,
          autoplayHoverPause: false,
          centerMode: true,
          speed: 1000,
          loop: true,
        },
      };
    },
    components: {},
    computed: {},
    async mounted() {
      this.admin = this.$store.state.CurrentUser.admin;
      try {
        const showcaseItems = (await ShowcaseService.getShowcaseItems()).data;
        this.showcaseSlides = showcaseItems.filter(
          (obj) => obj.type == "carousel"
        );
        this.showcaseCards = showcaseItems.filter((obj) => obj.type == "card");
        this.showcaseBigCards = showcaseItems.filter(
          (obj) => obj.type == "big card"
        );
      } catch (error) {
        console.log(error.response.data.error);
      }
    },
    methods: {},
  };
  </script>
  
  <style lang="scss" scoped></style>
  