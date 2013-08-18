Explorer.Router.map (match)->
  @route 'entries', path: '/'
  # match('/').to('index')

Explorer.EntriesRoute = Ember.Route.extend
  setupController: (controller) -> controller.set('content', [])
