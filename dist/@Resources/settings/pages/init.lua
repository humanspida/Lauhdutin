local Pages
do
  local _class_0
  local _base_0 = {
    getCount = function(self)
      return #self.pages
    end,
    loadPage = function(self, index)
      assert(type(index) == 'number' and index % 1 == 0, '"Pages.loadPage" expected "index" to be an integer.')
      assert(index > 0 and index <= self:getCount(), ('"Pages.loadPage" expected "index" to be between 1 and %d, but instead got %d.'):format(self:getCount(), index))
      self.currentPage = self.pages[index]
      return self.currentPage:getTitle(), self.currentPage:getSettings()
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self)
      self.pages = {
        require('settings.pages.skin')(),
        require('settings.pages.shortcuts')(),
        require('settings.pages.steam')(),
        require('settings.pages.battlenet')(),
        require('settings.pages.gog_galaxy')()
      }
      self.currentPage = nil
    end,
    __base = _base_0,
    __name = "Pages"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Pages = _class_0
end
return Pages
