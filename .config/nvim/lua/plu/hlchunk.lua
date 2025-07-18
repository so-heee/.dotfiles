local hlchunk_status_ok, hlchunk = pcall(require, 'hlchunk')
if not hlchunk_status_ok then
    return
end

hlchunk.setup {
    chunk = {
        enable = true
    },
    indent = {
        enable = true
    },
    blank = {
        enable = true
    },
    line_num = {
        enable = true
    }
}
