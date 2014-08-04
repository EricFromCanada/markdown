define markdown_hr => type {
    data
        private render,
        private leftover

    public onCreate(lines::staticarray) => {
        local(line1) = #lines->first

        if(
            regExp(-input=#line1, -find=`^-\s*-\s*-(-|\s)*$`)->matches or
            regExp(-input=#line1, -find=`^_\s*_\s*_(_|\s)*$`)->matches or
            regExp(-input=#line1, -find=`^\*\s*\*\s*\*(\*|\s)*$`)->matches
        ) => {
            .render   = '<hr />'
            .leftover = #lines->sub(2)
        else
            .render   = ''
            .leftover = #lines
        }
    }


    public
        render   => .`render`,
        leftover => .`leftover`
}