Þ          ¬               <  ²   =     ð          (  r   D  ;  ·  ®   ó     ¢  /   5     e  -   }  ~   «  z   *     ¥  U  >  b     8   ÷  S  0	  ß   
  0   d          µ     Ì  ;  U  ¥        7  '   Ê     ò  3   	  ¦   =  z   ä  »   _  U    t   q  U   æ   A collection of Python gradient operators can be found in ``python/tvm/relay/op/_tensor_grad.py``. We will walk through two representative examples: ``sigmoid`` and ``multiply``. Adding a Gradient in Python Adding an Operator to Relay Arity (number of arguments) Defining a C++ function to produce a call node for the operator and registering a Python API hook for the function For example, see ``src/relay/op/type_relations.h`` and their implementations. E.g., ``BroadcastRel`` takes two input types and an output type, checks that they are all tensor types with the same underlying data type, and finally ensures that the shape of the output type is the broadcast of the input types' shapes. In order to use TVM operators from within the Relay IR, the operators need to be registered in Relay in order to ensure that they will be integrated into Relay's type system. It may be necessary to add another type relation to ``type_relations.h`` if the existing ones do not capture the behavior of the desired operator. Names and descriptions for positional arguments Registering an Operator Registering an operator requires three steps: TVM already has an operator registry, but Relay cannot properly incorporate TVM operators without additional type information. The ``RELAY_REGISTER_OP`` macro in C++ allows a developer to specify the following information about an operator in Relay: The file ``src/relay/op/tensor/binary.cc`` provides examples of the first two steps, while ``python/tvm/relay/op/tensor.py`` gives examples of the last. The inputs here are the original operator ``orig`` and a gradient ``grad`` to accumulate into. What we return is a list, where the element at the i'th index is the derivative of the operator with respect to the operator's i'th input. In general, the gradient will return a list with as many elements as there are inputs to the base operator. Using the ``RELAY_REGISTER_OP`` macro in C++ to register the operator's arity and type information Wrapping the above Python API hook in a neater interface Project-Id-Version: tvm 0.8.dev0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2021-01-04 20:34+0900
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: kr
Language-Team: kr <LL@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.9.0
 íì´ì¬ ê¸°ì¸ê¸° ì°ì°ìì ëª¨ìì ``python/tvm/relay/op/_tensor_grad.py`` ìì ì°¾ìë³¼ ì ììµëë¤. ëíì ì¸ ë ê°ì§ ìì ë¡ì ``sigmoid`` ì ``multiply`` ë¥¼ ëìì¼ë¡ ë¤ë¤ë³´ê² ìµëë¤. íì´ì¬ì¼ë¡ ê¸°ì¸ê¸°(Gradient) ì¶ê°íê¸° Relayì ì°ì°ì ì¶ê°íê¸° í­ ì(ì¸ìì ì) ì°ì°ìì ëí ì½ ë¸ëë¥¼ ì°ì¶íë C++ í¨ìë¥¼ ì ìíê³  í´ë¹ í¨ìë¥¼ íí¹(hook)íë íì´ì¬ API ë±ë¡íê¸° For example, see ``src/relay/op/type_relations.h`` and their implementations. E.g., ``BroadcastRel`` takes two input types and an output type, checks that they are all tensor types with the same underlying data type, and finally ensures that the shape of the output type is the broadcast of the input types' shapes. Relay IR ë´ìì TVM ì°ì°ìë¥¼ ì¬ì©íë ¤ë©´, í´ë¹ ì°ì°ìë¤ì´ Relay íì ì²´ê³ì íµí©ë  ì ìëë¡ Relayì ë±ë¡ë  íìê° ììµëë¤. It may be necessary to add another type relation to ``type_relations.h`` if the existing ones do not capture the behavior of the desired operator. ìì¹ê·ì  ì¸ìì ëªì¹­ê³¼ ìì  ì°ì°ì ë±ë¡íê¸° ì°ì°ì ë±ë¡ì ì¸ ë¨ê³ê° íìí©ëë¤.  TVMì ì´ë¯¸ ì°ì°ì ë ì§ì¤í¸ë¦¬ë¥¼ ë³´ì íê³  ìì¼ë, ì¶ê°ì ì¸ íì ì ë³´ ìì´ë Relayê° TVM ì°ì°ìë¥¼ ì ì í íì©íì§ ëª»í©ëë¤. The ``RELAY_REGISTER_OP`` macro in C++ allows a developer to specify the following information about an operator in Relay: ì²ì ë ë¨ê³ì ììë ``src/relay/op/tensor/binary.cc`` íì¼ìì, ë§ì§ë§ ë¨ê³ ììë ``python/tvm/relay/op/tensor.py`` íì¼ìì ê°ê° ì°¸ê³ í  ì ììµëë¤. The inputs here are the original operator ``orig`` and a gradient ``grad`` to accumulate into. What we return is a list, where the element at the i'th index is the derivative of the operator with respect to the operator's i'th input. In general, the gradient will return a list with as many elements as there are inputs to the base operator. ì°ì°ìì í­ ì(arity)ì íì ì ë³´ë¥¼ ë±ë¡íê¸° ìí´ ``RELAY_REGISTER_OP`` C++ ë§¤í¬ë¡ ì¬ì©íê¸° ìê¸° íì´ì¬ API íí¬(hook)ë¥¼ ë³´ë¤ ê¹ëí ì¸í°íì´ì¤ë¡ ëííê¸° 