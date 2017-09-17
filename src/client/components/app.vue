<template>
  <div>
    <Vue-Header></Vue-Header>
    <component :is="currentView" v-on:add-case="gotoAddCase"></component>
    <Vue-Footer></Vue-Footer>
  </div>
</template>

<script lang="coffee">
  import Header from './header.vue'
  import Content from './content.vue'
  import Footer from './footer.vue'

  import AddCaseContent from './add_case/content.vue'

  export default
    data: () ->
      currentView: 'Vue-Content'

    components:
      'Vue-Header': Header
      'Vue-Content': Content
      'Vue-Footer': Footer
      'Add-Case-Content': AddCaseContent

    methods:
      gotoAddCase: ->
        @currentView = 'Add-Case-Content'

</script>
