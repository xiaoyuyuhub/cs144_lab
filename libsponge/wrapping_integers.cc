#include "wrapping_integers.hh"

#include <iostream>
// Dummy implementation of a 32-bit wrapping integer

// For Lab 2, please replace with a real implementation that passes the
// automated checks run by `make check_lab2`.

template <typename... Targs>
void DUMMY_CODE(Targs &&... /* unused */) {}

using namespace std;

//! Transform an "absolute" 64-bit sequence number (zero-indexed) into a WrappingInt32
//! \param n The input absolute 64-bit sequence number
//! \param isn The initial sequence number
WrappingInt32 wrap(uint64_t n, WrappingInt32 isn) { return isn + uint32_t(n); }

//! Transform a WrappingInt32 into an "absolute" 64-bit sequence number (zero-indexed)
//! \param n The relative sequence number
//! \param isn The initial sequence number
//! \param checkpoint A recent absolute 64-bit sequence number
//! \returns the 64-bit sequence number that wraps to `n` and is closest to `checkpoint`
//!
//! \note Each of the two streams of the TCP connection has its own ISN. One stream
//! runs from the local TCPSender to the remote TCPReceiver and has one ISN,
//! and the other stream runs from the remote TCPSender to the local TCPReceiver and
//! has a different ISN.
uint64_t unwrap(WrappingInt32 n, WrappingInt32 isn, uint64_t checkpoint) {
    uint64_t tmp = 0;
    uint64_t tmp1 = 0;
    if (n - isn < 0) {
        //通下，如果n-isn小于0，就代表要转换以下了，就像isn=6,n=4,4-6=-2。
        //如果10是intmax，这个绝对距离就是10+(4-6)=8了，无非就是8，18，28。。。
        //后面有图可以说明
        tmp = uint64_t(n - isn + (1l << 32));
    } else {
        //如果n-isn大于0，就代表当前这个传入的n大于初始化isn，这个就比较简单
        //就像isn=6,n=8,8-6=2,这个2直接就是觉得的序列号了，后边只需要判断与
        //checkpoint的距离就行了，如果10是intmax，那么这个2无非就是2，12，22。。。
        tmp = uint64_t(n - isn);
    }
    //如果大于了直接返回，这里要注意，上面只做了一次+(1l << 32)处理，所以理论上来说只会是
    //第一个范围的数据
    if (tmp >= checkpoint)
        return tmp;
    tmp |= ((checkpoint >> 32) << 32);
    while (tmp <= checkpoint)
        //这里就是循环加intMax了，知道tem比checkpoint大，也就是在checkpoint之上
        tmp += (1ll << 32);
    //这里减一下，也就是可能在checkpoint以上，或者以下，然后在下面进行判断
    tmp1 = tmp - (1ll << 32);
    //在checkpoint上下判断，判断哪个最近取哪个
    return (checkpoint - tmp1 < tmp - checkpoint) ? tmp1 : tmp;
}
