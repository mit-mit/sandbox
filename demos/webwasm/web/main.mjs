  let buildArgsList;

// `modulePromise` is a promise to the `WebAssembly.module` object to be
//   instantiated.
// `importObjectPromise` is a promise to an object that contains any additional
//   imports needed by the module that aren't provided by the standard runtime.
//   The fields on this object will be merged into the importObject with which
//   the module will be instantiated.
// This function returns a promise to the instantiated module.
export const instantiate = async (modulePromise, importObjectPromise) => {
    let dartInstance;

      function stringFromDartString(string) {
        const totalLength = dartInstance.exports.$stringLength(string);
        let result = '';
        let index = 0;
        while (index < totalLength) {
          let chunkLength = Math.min(totalLength - index, 0xFFFF);
          const array = new Array(chunkLength);
          for (let i = 0; i < chunkLength; i++) {
              array[i] = dartInstance.exports.$stringRead(string, index++);
          }
          result += String.fromCharCode(...array);
        }
        return result;
    }

    function stringToDartString(string) {
        const length = string.length;
        let range = 0;
        for (let i = 0; i < length; i++) {
            range |= string.codePointAt(i);
        }
        if (range < 256) {
            const dartString = dartInstance.exports.$stringAllocate1(length);
            for (let i = 0; i < length; i++) {
                dartInstance.exports.$stringWrite1(dartString, i, string.codePointAt(i));
            }
            return dartString;
        } else {
            const dartString = dartInstance.exports.$stringAllocate2(length);
            for (let i = 0; i < length; i++) {
                dartInstance.exports.$stringWrite2(dartString, i, string.charCodeAt(i));
            }
            return dartString;
        }
    }

      // Converts a Dart List to a JS array. Any Dart objects will be converted, but
    // this will be cheap for JSValues.
    function arrayFromDartList(constructor, list) {
        const length = dartInstance.exports.$listLength(list);
        const array = new constructor(length);
        for (let i = 0; i < length; i++) {
            array[i] = dartInstance.exports.$listRead(list, i);
        }
        return array;
    }

    buildArgsList = function(list) {
        const dartList = dartInstance.exports.$makeStringList();
        for (let i = 0; i < list.length; i++) {
            dartInstance.exports.$listAdd(dartList, stringToDartString(list[i]));
        }
        return dartList;
    }

    // A special symbol attached to functions that wrap Dart functions.
    const jsWrappedDartFunctionSymbol = Symbol("JSWrappedDartFunction");

    function finalizeWrapper(dartFunction, wrapped) {
        wrapped.dartFunction = dartFunction;
        wrapped[jsWrappedDartFunctionSymbol] = true;
        return wrapped;
    }

    // Imports
    const dart2wasm = {

  _18193: s => stringToDartString(JSON.stringify(stringFromDartString(s))),
_18194: s => console.log(stringFromDartString(s)),
_18096: o => o === undefined,
_18097: o => typeof o === 'boolean',
_18098: o => typeof o === 'number',
_18100: o => typeof o === 'string',
_18103: o => o instanceof Int8Array,
_18104: o => o instanceof Uint8Array,
_18105: o => o instanceof Uint8ClampedArray,
_18106: o => o instanceof Int16Array,
_18107: o => o instanceof Uint16Array,
_18108: o => o instanceof Int32Array,
_18109: o => o instanceof Uint32Array,
_18110: o => o instanceof Float32Array,
_18111: o => o instanceof Float64Array,
_18112: o => o instanceof ArrayBuffer,
_18113: o => o instanceof DataView,
_18114: o => o instanceof Array,
_18115: o => typeof o === 'function' && o[jsWrappedDartFunctionSymbol] === true,
_18119: (l, r) => l === r,
_18120: o => o,
_18121: o => o,
_18122: o => o,
_18123: b => !!b,
_18124: o => o.length,
_18127: (o, i) => o[i],
_18128: f => f.dartFunction,
_18129: l => arrayFromDartList(Int8Array, l),
_18130: l => arrayFromDartList(Uint8Array, l),
_18131: l => arrayFromDartList(Uint8ClampedArray, l),
_18132: l => arrayFromDartList(Int16Array, l),
_18133: l => arrayFromDartList(Uint16Array, l),
_18134: l => arrayFromDartList(Int32Array, l),
_18135: l => arrayFromDartList(Uint32Array, l),
_18136: l => arrayFromDartList(Float32Array, l),
_18137: l => arrayFromDartList(Float64Array, l),
_18138: (data, length) => {
          const view = new DataView(new ArrayBuffer(length));
          for (let i = 0; i < length; i++) {
              view.setUint8(i, dartInstance.exports.$byteDataGetUint8(data, i));
          }
          return view;
        },
_18139: l => arrayFromDartList(Array, l),
_18140: stringFromDartString,
_18148: (o, p) => o[p],
_18144: l => new Array(l),
_18152: o => String(o),
_18259: (o) => new DataView(o.buffer, o.byteOffset, o.byteLength),
_18211: (a, i) => a.push(i),
_18222: a => a.length,
_18224: (a, i) => a[i],
_18225: (a, i, v) => a[i] = v,
_18227: a => a.join(''),
_18228: (s, i) => s.charCodeAt(i),
_18240: (s, p, i) => s.indexOf(p, i),
_18242: s => s.length,
_18243: (s, i) => s[i],
_18245: (o, start, length) => new Uint8Array(o.buffer, o.byteOffset + start, length),
_18246: (o, start, length) => new Int8Array(o.buffer, o.byteOffset + start, length),
_18247: (o, start, length) => new Uint8ClampedArray(o.buffer, o.byteOffset + start, length),
_18248: (o, start, length) => new Uint16Array(o.buffer, o.byteOffset + start, length),
_18249: (o, start, length) => new Int16Array(o.buffer, o.byteOffset + start, length),
_18250: (o, start, length) => new Uint32Array(o.buffer, o.byteOffset + start, length),
_18251: (o, start, length) => new Int32Array(o.buffer, o.byteOffset + start, length),
_18254: (o, start, length) => new Float32Array(o.buffer, o.byteOffset + start, length),
_18255: (o, start, length) => new Float64Array(o.buffer, o.byteOffset + start, length),
_18263: Function.prototype.call.bind(Object.getOwnPropertyDescriptor(DataView.prototype, 'byteLength').get),
_18264: (b, o) => new DataView(b, o),
_18266: Function.prototype.call.bind(DataView.prototype.getUint8),
_18268: Function.prototype.call.bind(DataView.prototype.getInt8),
_18270: Function.prototype.call.bind(DataView.prototype.getUint16),
_18272: Function.prototype.call.bind(DataView.prototype.getInt16),
_18274: Function.prototype.call.bind(DataView.prototype.getUint32),
_18276: Function.prototype.call.bind(DataView.prototype.getInt32),
_18282: Function.prototype.call.bind(DataView.prototype.getFloat32),
_18284: Function.prototype.call.bind(DataView.prototype.getFloat64),
_18204: (c) =>
              queueMicrotask(() => dartInstance.exports.$invokeCallback(c)),
_18169: v => stringToDartString(v.toString()),
_18180: Date.now,
_18182: s => new Date(s * 1000).getTimezoneOffset() * 60 ,
_18184: () => {
          let stackString = new Error().stack.toString();
          let userStackString = stackString.split('\n').slice(3).join('\n');
          return stringToDartString(userStackString);
        },
_3148: (x0,x1) => x0.textContent = x1,
_3152: () => globalThis.document,
_3214: (x0,x1) => x0.querySelector(x1)
      };

    const baseImports = {
        dart2wasm: dart2wasm,

  
          Math: Math,
        Date: Date,
        Object: Object,
        Array: Array,
        Reflect: Reflect,
    };
    dartInstance = await WebAssembly.instantiate(await modulePromise, {
        ...baseImports,
        ...(await importObjectPromise),
    });

    return dartInstance;
}

// Call the main function for the instantiated module
// `moduleInstance` is the instantiated dart2wasm module
// `args` are any arguments that should be passed into the main function.
export const invoke = (moduleInstance, ...args) => {
    const dartMain = moduleInstance.exports.$getMain();
    const dartArgs = buildArgsList(args);
    moduleInstance.exports.$invokeMain(dartMain, dartArgs);
}

