#include "tcp_receiver.hh"

#include <algorithm>

// Dummy implementation of a TCP receiver

// For Lab 2, please replace with a real implementation that passes the
// automated checks run by `make check_lab2`.

template <typename... Targs>
void DUMMY_CODE(Targs &&... /* unused */) {}

using namespace std;

void TCPReceiver::segment_received(const TCPSegment &seg) {
    //获取header
    const TCPHeader head = seg.header();

    //判断是否异常情况，不可能syn为1，而且_synReceived也为1，因为第一次syn为1，后面就为
    //0，之后_synReceived就变为1了
    if (!head.syn && !_synReceived) {
        return;
    }

    // extract data from the payload
    string data = seg.payload().copy();

    bool eof = false;

    // first SYN received，这就是判断TCP3次握手的第一个包
    if (head.syn && !_synReceived) {
        _synReceived = true;
        _isn = head.seqno;
        if (head.fin) {
            _finReceived = eof = true;
        }
        _reassembler.push_substring(data, 0, eof);
        return;
    }

    // FIN received，是否传输结束
    if (_synReceived && head.fin) {
        _finReceived = eof = true;
    }

    // convert the seqno into absolute seqno，先获取checkpoint，也就是上一次返回的
    //ack，这里也符合之前warp转换的过程，checkpoint是已经接收到最近一份数据结尾的下标
    uint64_t checkpoint = _reassembler.ack_index();
    //这里就开始解码绝对序列号，获取数据绝对序列
    uint64_t abs_seqno = unwrap(head.seqno, _isn, checkpoint);
    //_synReceived，aft syn received,_synReceived=1.stream_idx=abs_seqno-1, syn need occupy 1 bit
    //这里开始获取填充数据的位置了，需要用绝对序列号-1，因为syn会占用绝对序列号1bit，但是在_reassembler里面没有syn，所以
    //要减1，不然就浪费了_reassembler中的1位
    uint64_t stream_idx = abs_seqno - _synReceived;

    // push the data into stream reassembler
    _reassembler.push_substring(data, stream_idx, eof);
}

optional<WrappingInt32> TCPReceiver::ackno() const {
    if (!_synReceived) {
        return nullopt;
    }
    //这里ack返回的值实际上就是之前传过来的seqno+1，比如第一次isn=123，seqno=123，TCP三次握手第一次ACK返回就是123+1=124。这也是为什么
    //uint64_t stream_idx = abs_seqno - _synReceived;abs_seqno要减一的原因。
    return wrap(_reassembler.ack_index() + 1 + (_reassembler.empty() && _finReceived), _isn);
}

size_t TCPReceiver::window_size() const { return _capacity - _reassembler.stream_out().buffer_size(); }
