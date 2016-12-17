module Megam
  class Request < Megam::RestAdapter
    def initialize(params)
      @id = nil
      @account_id = nil
      @cat_id = nil
      @name = nil
      @cattype = nil
      @action = nil
      @category = nil
      @some_msg = {}
      @created_at = nil
      super(params)
    end

    def request
      self
    end


    def id(arg=nil)
      if arg != nil
        @id = arg
      else
      @id
      end
    end

    def account_id(arg=nil)
      if arg != nil
        @account_id = arg
      else
      @account_id
      end
    end

    def cat_id(arg=nil)
      if arg != nil
        @cat_id = arg
      else
      @cat_id
      end
    end

    def name(arg=nil)
      if arg != nil
        @name = arg
      else
      @name
      end
    end
    def cattype(arg=nil)
      if arg != nil
        @cattype = arg
      else
      @cattype
      end
    end

    def action(arg=nil)
      if arg != nil
        @action = arg
      else
      @action
      end
    end


    def category(arg=nil)
      if arg != nil
        @category = arg
      else
      @category
      end
    end


    def created_at(arg=nil)
      if arg != nil
        @created_at = arg
      else
      @created_at
      end
    end

    def some_msg(arg=nil)
      if arg != nil
        @some_msg = arg
      else
      @some_msg
      end
    end

    def error?
      crocked  = true if (some_msg.has_key?(:msg_type) && some_msg[:msg_type] == "error")
    end

    # Transform the ruby obj ->  to a Hash
    def to_hash
      index_hash = Hash.new
      index_hash["json_claz"] = self.class.name
      index_hash["id"] = id
      index_hash["account_id"] = account_id
      index_hash["cat_id"] = cat_id
      index_hash["name"] = name
      index_hash["cattype"] = cattype
      index_hash["action"] = action
      index_hash["category"] = category
      index_hash["created_at"] = created_at
      index_hash
    end

    # Serialize this object as a hash: called from JsonCompat.
    # Verify if this called from JsonCompat during testing.
    def to_json(*a)
      for_json.to_json(*a)
    end

    def for_json
      result = {
        "id" => id,
        "account_id" => account_id,
        "cat_id" => cat_id,
        "name" => name,
        "cattype" => cattype,
        "action" => action,
        "category" => category,
        "created_at" => created_at
      }
      result
    end

    #
    def self.json_create(o)
      node = new(o)
      node.id(o["id"]) if o.has_key?("id")
      node.account_id(o["account_id"]) if o.has_key?("account_id")
      node.cat_id(o["cat_id"]) if o.has_key?("cat_id")
      node.name(o["name"]) if o.has_key?("name")
      node.cattype(o["cattype"]) if o.has_key?("cattype")
      node.action(o["action"]) if o.has_key?("action")
      node.category(o["category"]) if o.has_key?("category")
      node.created_at(o["created_at"]) if o.has_key?("created_at")
      #success or error
      node.some_msg[:code] = o["code"] if o.has_key?("code")
      node.some_msg[:msg_type] = o["msg_type"] if o.has_key?("msg_type")
      node.some_msg[:msg]= o["msg"] if o.has_key?("msg")
      node.some_msg[:links] = o["links"] if o.has_key?("links")
      node
    end

    def self.from_hash(o)
      node = self.new(o)
      node.from_hash(o)
      node
    end

    def from_hash(o)
      @id = o[:id] if o.has_key?(:id)
      @account_id = o[:account_id] if o.has_key?(:account_id)
      @cat_id  = o[:cat_id] if o.has_key?(:cat_id)
      @name = o[:name] if o.has_key?(:name)
      @cattype = o[:cattype] if o.has_key?(:cattype)
      @action = o[:action] if o.has_key?(:action)
      @category = o[:category] if o.has_key?(:category)
      @created_at = o[:created_at] if o.has_key?(:created_at)
      self
    end


    def self.create(params)
      acct = from_hash(params)
      acct.create
    end

    # Create the node via the REST API
    def create
      megam_rest.post_request(to_hash)
    end


     def self.show(params)
      prede = self.new(params)
      prede.megam_rest.get_requests
    end
#have to check list
     def self.list(params)
      prede = self.new(params)
      prede.megam_rest.get_request(n_name)
    end

    def to_s
      Megam::Stuff.styled_hash(to_hash)
    end

  end
end
