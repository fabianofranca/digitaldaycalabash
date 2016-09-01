
module BaseModule
    def touch_item(query)
        touch query
    end

    def has_text(text, timeout = 5)
        wait_for(timeout: timeout) { element_exists "* marked:'#{text}'" }
    end
end