<template xmlns="http://www.w3.org/1999/html">
  <div class="row">
    <div class="col-10">
      <div class="card">
        <div class="card-header">
          <h5 class="mb-0">
            <a href="#" v-on:click="toggle">{{ item.name }}</a>
          </h5>
        </div>
        <div class="card-block" v-bind:style="{display: state}">
          <span class="font-weight-bold">Descripction:</span> {{ item.description }}<br>
          <span class="font-weight-bold">Precondition:</span> {{item.precondition}}<br>
          <span class="font-weight-bold">Poscondition:</span> {{item.poscondition}}<br>
          <span class="font-weight-bold">Trigger:</span> {{item.trigger}}<br>
          <template v-for="step in item.course">
            <span class="font-weight-bold">{{step.index}}:</span> {{step.text}}<br>
            <template v-for="extension in step.extensions">
              <span class="font-italic">e{{extension.extension_number}}: {{extension.description}}</span><br>
            </template>
          </template>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
    export default {
        props: ['item'],
        data: function () {
            return {
                state: 'none'
            }
        },

        methods: {
            toggle: function () {
                if (this.state === 'none') {
                    this.state = 'block';
                } else {
                    this.state = 'none';
                }
            }
        }
    }

</script>